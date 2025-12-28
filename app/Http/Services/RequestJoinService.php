<?php

namespace App\Http\Services;

use App\Enums\Member\MemberStatus;
use App\Enums\Permission\RoleName;
use App\Filters\Main\BaseFilter;
use App\Http\Services\Base\CrudService;
use App\Models\JoinRequestReview;
use App\Models\Member;
use App\Models\User;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;


class RequestJoinService extends CrudService
{
    public function create(array $data): \App\Models\Base\BaseModel
    {
        return DB::transaction(function () use ($data) {
            /** @var User $user */
            $user = User::create($data);
            $data['user_id'] = $user->id;


            $certificates = $data['certificates'] ?? [];

            $member = parent::create($data);
            $user->assignRole(RoleName::MEMBER->value);

            if (!empty($certificates)) {
                $member->certificates()->syncWithoutDetaching($certificates);
            }

            return $member;

        });
    }

    public function getAll(?BaseFilter $filter = null, bool $withTrashed = false): Builder
    {
        $query = Member::query()->where('status', '!=', MemberStatus::APPROVED->value);
        return $filter ? $filter->apply($query) : $query;
    }

    public function find(mixed $id): \App\Models\Base\BaseModel
    {
        return Member::where('status', '!=', MemberStatus::APPROVED->value)->findOrFail($id);
    }

    public function reviewRequest(array $data): void
    {
        $user = Auth::user();

        DB::transaction(function () use ($data, $user) {
            $member = Member::findOrFail($data['member_id']);

            abort_if($member->status === MemberStatus::APPROVED->value, 422, 'Request already approved');
            abort_if($member->status === MemberStatus::REJECTED->value, 422, 'Request already rejected');

            JoinRequestReview::updateOrCreate(
                [
                    'join_request_id' => $member->id,
                    'reviewer_id' => $user->id,
                ],
                [
                    'is_approved' => $data['approve'],
                    'note' => $data['note'] ?? null,
                ]
            );
        });
    }

    public function finalizeRequest(int $memberId, int $status): void
    {
        DB::transaction(function () use ($memberId, $status) {
            $member = Member::findOrFail($memberId);

            $member->update(['status' => $status]);

            if (!$member->user->hasRole(RoleName::MEMBER->value)) {
                $member->user->assignRole(RoleName::MEMBER->value);
            }

        });
    }



    protected function getModelClass(): string
    {
        return Member::class;
    }
}
