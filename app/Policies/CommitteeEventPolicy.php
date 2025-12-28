<?php

namespace App\Policies;

use App\Enums\Permission\PermissionName;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Models\CommitteeEvent;
use App\Models\User;

class CommitteeEventPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ALL_COMMITTEE_EVENTS->value);
    }

    public function view(User $user, CommitteeEvent $committeeEvent): bool
    {
        return $user->can(PermissionName::CAN_VIEW_COMMITTEE_EVENTS->value);
    }

    public function create(User $user): bool
    {
        return $user->can(PermissionName::CAN_CREATE_COMMITTEE_EVENTS->value);
    }

    public function update(User $user, CommitteeEvent $committeeEvent): bool
    {
        return $user->can(PermissionName::CAN_UPDATE_COMMITTEE_EVENTS->value);
    }

    public function delete(User $user, CommitteeEvent $committeeEvent): bool
    {
        return $user->can(PermissionName::CAN_DELETE_COMMITTEE_EVENTS->value);
    }
}
