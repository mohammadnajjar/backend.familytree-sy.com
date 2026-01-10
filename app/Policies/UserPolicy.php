<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Enums\Permission\PermissionName;

class UserPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ALL_USERS->value);
    }

    public function view(User $user, User $model): bool
    {
        return $user->can(PermissionName::CAN_VIEW_USERS->value) || $user->id === $model->id;
    }

    public function create(User $user): bool
    {
        return $user->can(PermissionName::CAN_CREATE_USERS->value);
    }

    public function update(User $user, User $model): bool
    {
        return $user->can(PermissionName::CAN_UPDATE_USERS->value) || $user->id === $model->id;
    }

    public function delete(User $user, User $model): bool
    {
        // Users cannot delete themselves
        if ($user->id === $model->id) {
            return false;
        }
        return $user->can(PermissionName::CAN_DELETE_USERS->value);
    }
}
