<?php

namespace App\Http\Services;

use App\Enums\Achievement\AchievementStatus;
use App\Enums\HistoricalEvent\HistoricalEventStatus;
use App\Enums\Member\MemberStatus;
use App\Enums\Notification\NotificationType;
use App\Enums\Photograph\PhotographStatus;
use App\Enums\User\UserSlide;
use App\Models\Achievement;
use App\Models\HistoricalEvent;
use App\Models\Member;
use App\Models\Notification;
use App\Models\Photograph;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification as FcmNotification;
use Kreait\Firebase\Messaging;
use App\Http\Services\Base\CrudService;
use App\Notifications\Base\BaseNotification;

class NotificationService extends CrudService
{
    protected Messaging $messaging;

    protected function getModelClass(): string
    {
        return Notification::class;
    }

    public function __construct()
    {
        $serviceAccountPath = storage_path('app/firebase/firebase.json');
        $factory = (new Factory)->withServiceAccount($serviceAccountPath);
        $this->messaging = $factory->createMessaging();
    }

    public function allNotification()
    {
        return $this->getQuery()->orderBy('created_at', 'desc');
    }

    public function getMyNotification()
    {
        $userId = Auth::id();

        $notifications = $this->getQuery()
            ->where(function ($q) use ($userId) {
                $q->where('user_id', $userId)
                    ->orWhereNull('user_id');
            })
            ->where(function ($q) {
                $q->where(function ($q) {
                    $q->where('type', NotificationType::REQUEST_JOIN->value)
                        ->whereHasMorph(
                            'entity',
                            [Member::class],
                            fn($q) => $q->where('status', '!=', MemberStatus::APPROVED->value)
                        );
                })
                    ->orWhere(function ($q) {
                        $q->where('type', NotificationType::NEW_EVENT->value)
                            ->whereHasMorph(
                                'entity',
                                [HistoricalEvent::class],
                                fn($q) => $q->where('status', '!=', HistoricalEventStatus::APPROVED->value)
                            );
                    })
                    ->orWhere(function ($q) {
                        $q->where('type', NotificationType::NEW_ACHIEVEMENT->value)
                            ->whereHasMorph(
                                'entity',
                                [Achievement::class],
                                fn($q) => $q->where('status', '!=', AchievementStatus::APPROVED->value)
                            );
                    })
                    ->orWhere(function ($q) {
                        $q->where('type', NotificationType::NEW_PHOTOGRAPH->value)
                            ->whereHasMorph(
                                'entity',
                                [Photograph::class],
                                fn($q) => $q->where('status', '!=', PhotographStatus::APPROVED->value)
                            );
                    })
                    ->orWhere(function ($q) {
                        $q->whereNotIn('type', [
                            NotificationType::REQUEST_JOIN->value,
                            NotificationType::NEW_EVENT->value,
                            NotificationType::NEW_ACHIEVEMENT->value,
                            NotificationType::NEW_PHOTOGRAPH->value,
                        ]);
                    });
            })
            ->orderBy('created_at', 'desc');

        Log::info("getMyNotification", [$notifications->toSql()]);

        $this->getQuery()
            ->where('user_id', $userId)
            ->where('is_seen', false)
            ->update(['is_seen' => true]);

        return $notifications;
    }

    public function getCountNotification()
    {
        $userId = Auth::id();

        return $this->getQuery()
            ->where('user_id', $userId)
            ->where('is_seen', false)
            ->where(function ($q) {
                $q->where(function ($q) {
                    $q->where('type', NotificationType::REQUEST_JOIN->value)
                        ->whereHasMorph(
                            'entity',
                            [Member::class],
                            fn($q) => $q->where('status', '!=', MemberStatus::APPROVED->value)
                        );
                })
                    ->orWhere(function ($q) {
                        $q->where('type', NotificationType::NEW_EVENT->value)
                            ->whereHasMorph(
                                'entity',
                                [HistoricalEvent::class],
                                fn($q) => $q->where('status', '!=', HistoricalEventStatus::APPROVED->value)
                            );
                    })
                    ->orWhere(function ($q) {
                        $q->where('type', NotificationType::NEW_ACHIEVEMENT->value)
                            ->whereHasMorph(
                                'entity',
                                [Achievement::class],
                                fn($q) => $q->where('status', '!=', AchievementStatus::APPROVED->value)
                            );
                    })
                    ->orWhere(function ($q) {
                        $q->where('type', NotificationType::NEW_PHOTOGRAPH->value)
                            ->whereHasMorph(
                                'entity',
                                [Photograph::class],
                                fn($q) => $q->where('status', '!=', PhotographStatus::APPROVED->value)
                            );
                    })
                    ->orWhere(function ($q) {
                        $q->whereNotIn('type', [
                            NotificationType::REQUEST_JOIN->value,
                            NotificationType::NEW_EVENT->value,
                            NotificationType::NEW_ACHIEVEMENT->value,
                            NotificationType::NEW_PHOTOGRAPH->value,
                        ]);
                    });
            })
            ->count();
    }

    /** ✉️ إرسال لجميع المستخدمين */
    public function sendToAll(BaseNotification $notification, $excludeUserId = null)
    {
        $tokens = User::whereNotNull('fcm_token')
            ->when($excludeUserId, fn($query) => $query->where('id', '!=', $excludeUserId))
            ->pluck('fcm_token')
            ->toArray();

        if (empty($tokens)) {
            Log::info('No users with FCM tokens found.');
            return 'No users with FCM tokens found.';
        }

        $message = CloudMessage::fromArray([
            'notification' => FcmNotification::create($notification->getTitle(), $notification->getBody()),
            'data' => [
                'message' => $notification->getBody(),
            ],
        ]);

        try {
            $this->messaging->sendMulticast($message, $tokens);

            Notification::create([
                'slide' => UserSlide::ALL_USERS->value,
                'type' => $notification->getType()->value,
                'title' => $notification->getTitle(),
                'body' => $notification->getBody(),
                'entity_id' => $notification->getEntityId(),
                'entity_type' => $notification->getEntityType(),
            ]);

            return 1;
        } catch (\Throwable $e) {
            Log::error('FCM Error: ' . $e->getMessage());
            return 0;
        }
    }

    /** ✉️ إرسال لمستخدم واحد */
    public function sendToUser(int $userId, BaseNotification $notification)
    {
        $user = User::find($userId);

        if (!$user || !$user->fcm_token) {
            Log::warning("User not found or has no FCM token.");
            return 0;
        }

        $message = CloudMessage::fromArray([
            'token' => $user->fcm_token,
            'notification' => FcmNotification::create($notification->getTitle(), $notification->getBody()),
            'data' => [
                'message' => $notification->getBody(),
            ],
        ]);

        try {
            $this->messaging->send($message);

            Notification::create([
                'slide' => UserSlide::ONE_USER->value,
                'type' => $notification->getType()->value,
                'title' => $notification->getTitle(),
                'user_id' => $user->id,
                'body' => $notification->getBody(),
                'entity_type' => $notification->getEntityType(),
                'entity_id' => $notification->getEntityId(),
            ]);

            return 1;
        } catch (\Throwable $e) {
            Log::error('FCM Send Error: ' . $e->getMessage());
            return 0;
        }
    }

    /** ✉️ إرسال لموضوع (دور محدد) */
    public function sendToRole(string $role, BaseNotification $notification)
    {
        $topic = 'role_' . $role;

        $message = CloudMessage::fromArray([
            'topic' => $topic,
            'notification' => FcmNotification::create($notification->getTitle(), $notification->getBody()),
            'data' => [
                'message' => $notification->getBody(),
            ],
        ]);

        try {
            $this->messaging->send($message);

            Notification::create([
                'slide' => UserSlide::ROLE_USER->value,
                'type' => $notification->getType()->value,
                'title' => $notification->getTitle(),
                'body' => $notification->getBody(),
                'topic_target' => $role,
                'entity_type' => $notification->getEntityType(),
                'entity_id' => $notification->getEntityId(),
            ]);

            return 1;
        } catch (\Throwable $e) {
            Log::error('FCM Role Send Error: ' . $e->getMessage());
            return 0;
        }
    }

    public function subscribeUserToTopic(User $user): bool
    {
        if (!$user->fcm_token) {
            Log::warning("User [{$user->id}] does not have FCM token.");
            return false;
        }

        $role = $user->role;
        $topic = 'role_' . $role;

        try {
            $this->messaging->subscribeToTopic($topic, [$user->fcm_token]);

            Log::info("User [{$user->id}] subscribed to topic [$topic]");
            return true;
        } catch (\Throwable $e) {
            Log::error("Failed to subscribe user to topic: " . $e->getMessage());
            return false;
        }
    }

    public function registerFcmToken(User $user, string $token): void
    {
        if ($user->fcm_token !== $token) {
            $user->fcm_token = $token;
            $user->save();
            $this->subscribeUserToTopic($user);
        }
    }
}
