<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Achievement;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Enums\Permission\PermissionName;

class AchievementPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ALL_ACHIEVEMENTS->value);
    }

    public function view(User $user, Achievement $achievement): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ACHIEVEMENTS->value);
    }

    public function create(User $user): bool
    {
        return $user->can(PermissionName::CAN_CREATE_ACHIEVEMENTS->value);
    }

    public function update(User $user, Achievement $achievement): bool
    {
        return $user->can(PermissionName::CAN_UPDATE_ACHIEVEMENTS->value);
    }

    public function delete(User $user, Achievement $achievement): bool
    {
        return $user->can(PermissionName::CAN_DELETE_ACHIEVEMENTS->value);
    }
}
