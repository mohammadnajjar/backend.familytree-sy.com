<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Member;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Enums\Permission\PermissionName;

class MemberPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ALL_MEMBERS->value);
    }

    public function viewAdminStats(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ADMIN_STATS->value);
    }

    public function viewMemberStats(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_MEMBER_STATS->value);
    }

    public function view(User $user, Member $member): bool
    {
        return $user->can(PermissionName::CAN_VIEW_MEMBERS->value);
    }

    public function create(User $user): bool
    {
        return $user->can(PermissionName::CAN_CREATE_MEMBERS->value);
    }

    public function update(User $user, Member $member): bool
    {
        return $user->can(PermissionName::CAN_UPDATE_MEMBERS->value);
    }

    public function delete(User $user, Member $member): bool
    {
        return $user->can(PermissionName::CAN_DELETE_MEMBERS->value);
    }

    public function viewAnyJR(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ALL_JOIN_REQUESTS->value);
    }

    public function viewJR(User $user, Member $member): bool
    {
        return $user->can(PermissionName::CAN_VIEW_JOIN_REQUESTS->value);
    }

    public function createJR(User $user): bool
    {
        return $user->can(PermissionName::CAN_CREATE_JOIN_REQUESTS->value);
    }

    public function updateJR(User $user, Member $member): bool
    {
        return $user->can(PermissionName::CAN_UPDATE_JOIN_REQUESTS->value);
    }

    public function deleteJR(User $user, Member $member): bool
    {
        return $user->can(PermissionName::CAN_DELETE_JOIN_REQUESTS->value);
    }
}
