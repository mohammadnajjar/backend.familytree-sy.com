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
        // Allow if user has explicit permission
        if ($user->can(PermissionName::CAN_CREATE_COMMITTEE_EVENTS->value)) {
            return true;
        }

        // Allow if user is admin
        if ($user->hasRole('admin')) {
            return true;
        }

        // Allow if user is a committee member (will be checked in controller)
        // Return true here to pass authorization, controller will verify specific committee membership
        return $user->member !== null;
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
