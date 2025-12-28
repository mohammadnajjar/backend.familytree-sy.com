<?php

namespace App\Policies;

use App\Models\User;
use App\Models\City;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Enums\Permission\PermissionName;

class CityPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ALL_CITIES->value);
    }

    public function view(User $user, City $city): bool
    {
        return $user->can(PermissionName::CAN_VIEW_CITIES->value);
    }

    public function create(User $user): bool
    {
        return $user->can(PermissionName::CAN_CREATE_CITIES->value);
    }

    public function update(User $user, City $city): bool
    {
        return $user->can(PermissionName::CAN_UPDATE_CITIES->value);
    }

    public function delete(User $user, City $city): bool
    {
        return $user->can(PermissionName::CAN_DELETE_CITIES->value);
    }
}
