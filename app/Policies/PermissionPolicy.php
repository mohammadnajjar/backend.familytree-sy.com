<?php

namespace App\Policies;

use App\Enums\Permission\PermissionName;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use Spatie\Permission\Models\Permission;

class PermissionPolicy
{
    use HandlesAuthorization;
    public function viewAny(User $user)
    {
        return $user->can(PermissionName::CAN_VIEW_ALL_PERMISSIONS->value);
    }

    public function view(User $user, Permission $permission)
    {
        return $user->can(PermissionName::CAN_VIEW_PERMISSIONS->value);
    }
}
