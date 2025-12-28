<?php

namespace App\Http\Services;

use App\Enums\Auth\personalAccessTokenType;
use App\Enums\Member\MemberStatus;
use App\Enums\Permission\RoleName;
use App\Enums\User\UserStatus;
use App\Http\Services\Base\BaseService;
use App\Models\Member;
use App\Models\Otp;
use App\Models\User;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

class AuthService extends BaseService
{
    private UserService $userService;
    private NotificationService $notificationService;

    public function __construct(UserService $userService, NotificationService $notificationService)
    {
        $this->userService = $userService;
        $this->notificationService = $notificationService;
    }


    public function loginMember(array $data): array
    {
        return $this->handleLogin(
            $data,
            personalAccessTokenType::member->value,
            isMember: true
        );
    }

    public function login(array $data): array
    {
        return $this->handleLogin(
            $data,
            personalAccessTokenType::admin->value
        );
    }

    private function handleLogin(array $data, string $tokenType, bool $isMember = false): array
    {
        return DB::transaction(function () use ($data, $tokenType, $isMember) {
            $user = User::where('mobile', $data['mobile'])->first();

            if (!$user || !Hash::check($data['password'], $user->password)) {
                abort(401, 'credentials not correct');
            }

            if ($user->status->value === UserStatus::INACTIVE->value) {
                abort(403, __('exceptions auth banned'));
            }
            if (!empty($data['fcm_token'])) {
                $this->notificationService->registerFcmToken($user, $data['fcm_token']);
            }
            if ($isMember) {
                $member = $user->member;
                abort_if(!$member, 403, __('exceptions unauthorized'));
                abort_if($member->status->value !== MemberStatus::APPROVED->value, 403, __('exceptions member not approved'));

                $token = $user->createToken('authToken', $tokenType)->plainTextToken;

                return [
                    'token' => $token,
                    'user' => $user,
                    'member' => $member,
                ];
            }

//            if (!$user->hasRole(RoleName::ADMIN->value)) {
//                abort(403, __('exceptions only admins can login'));
//            }

            $roles = $user->roles ? $user->roles->pluck('name')->toArray() : [];
            if (count($roles) === 1 && $roles[0] === 'member') {
                abort(403, __('exceptions unauthorized only member role'));
            }

            $token = $user->createToken('authToken', $tokenType)->plainTextToken;

            return [
                'token' => $token,
                'user' => $user,
            ];
        });
    }

    private function validateOtp(string $mobile, string $code): void
    {
        $otp = Otp::where('mobile', $mobile)
            ->where('otp', $code)
            ->where('is_verified', false)
            ->where('expires_at', '>', Carbon::now())
            ->first();

        abort_if(!$otp, 400, __('exceptions.invalid_otp'));

        $otp->update(['is_verified' => true]);
    }


    public function logout(): void
    {
        /** @var User $user */
        $user = Auth::user();
        $user->currentAccessToken()->delete();
    }

    private function generateCode(): string
    {
        return '12345';
//        return (strtolower(env('APP_ENV')) === 'test') ? '12345' : (string) random_int(10000, 99999);
    }

    public function sendOtp(string $mobile, $signature): void
    {
        $otp = $this->generateCode();

        $otpData = Otp::updateOrCreate(['mobile' => $mobile], [
            'otp' => $otp,
            'is_verified' => false,
            'expires_at' => Carbon::now()->addMinutes(5) // Set OTP expiry time to 5 minutes from now
        ]);

        // TODO: Send the OTP via SMS or email using the notification system
    }

    public function getMe(): array
    {
        /** @var User $user */
        $user = Auth::user();

        return [
            'user' => $user,
        ];
    }

    public function memberGetMe()
    {
        $member = Auth::user()->member;
        abort_if(!$member, 401, __('exceptions.unauthorized'));
        return $member;
    }

    public function updateMe(array $data): User
    {
        return $this->userService->update(Auth::id(), $data);
    }


    public function memberUpdateMe(array $data)
    {
        /** @var User $user */
        $user = Auth::user();
        $member = $user->member;

        abort_if(!$member, 401, __('exceptions.unauthorized'));

        // تحديث بيانات المستخدم والعضو
        $user->update($data);
        $member->update($data);

        // تحديث الشهادات
        if (isset($data['certificateIds']) && is_array($data['certificateIds'])) {
            $member->certificates()->sync($data['certificateIds']);
        }

        return Member::with(['certificates'])->findOrFail($member->user_id);
    }

}
