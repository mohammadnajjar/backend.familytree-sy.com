<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Enums\Permission\PermissionName;

class GeneralSettingPolicy
{
    use HandlesAuthorization;

    public function view(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_GENERAL_SETTINGS->value);
    }

    public function update(User $user): bool
    {
        return $user->can(PermissionName::CAN_UPDATE_GENERAL_SETTINGS->value);
    }
}
