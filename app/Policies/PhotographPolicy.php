<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Photograph;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Enums\Permission\PermissionName;

class PhotographPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ALL_PHOTOGRAPHS->value);
    }

    public function view(User $user, Photograph $photograph): bool
    {
        return $user->can(PermissionName::CAN_VIEW_PHOTOGRAPHS->value);
    }

    public function create(User $user): bool
    {
        return $user->can(PermissionName::CAN_CREATE_PHOTOGRAPHS->value);
    }

    public function update(User $user, Photograph $photograph): bool
    {
        return $user->can(PermissionName::CAN_UPDATE_PHOTOGRAPHS->value);
    }

    public function delete(User $user, Photograph $photograph): bool
    {
        return $user->can(PermissionName::CAN_DELETE_PHOTOGRAPHS->value);
    }
}
