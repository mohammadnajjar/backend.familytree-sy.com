<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Donation;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Enums\Permission\PermissionName;

class DonationPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ALL_DONATIONS->value);
    }

    public function view(User $user, Donation $donation): bool
    {
        return $user->can(PermissionName::CAN_VIEW_DONATIONS->value);
    }

    public function create(User $user): bool
    {
        return $user->can(PermissionName::CAN_CREATE_DONATIONS->value);
    }

    public function update(User $user, Donation $donation): bool
    {
        return $user->can(PermissionName::CAN_UPDATE_DONATIONS->value);
    }

    public function delete(User $user, Donation $donation): bool
    {
        return $user->can(PermissionName::CAN_DELETE_DONATIONS->value);
    }
}
