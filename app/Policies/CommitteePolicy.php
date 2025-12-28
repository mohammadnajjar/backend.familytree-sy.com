<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Committee;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Enums\Permission\PermissionName;

class CommitteePolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ALL_COMMITTEES->value);
    }

    public function view(User $user, Committee $committee): bool
    {
        return $user->can(PermissionName::CAN_VIEW_COMMITTEES->value);
    }

    public function create(User $user): bool
    {
        return $user->can(PermissionName::CAN_CREATE_COMMITTEES->value);
    }

    public function update(User $user, Committee $committee): bool
    {
        return $user->can(PermissionName::CAN_UPDATE_COMMITTEES->value);
    }

    public function delete(User $user, Committee $committee): bool
    {
        return $user->can(PermissionName::CAN_DELETE_COMMITTEES->value);
    }
}
