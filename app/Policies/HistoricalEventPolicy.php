<?php

namespace App\Policies;

use App\Models\User;
use App\Models\HistoricalEvent;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Enums\Permission\PermissionName;

class HistoricalEventPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ALL_HISTORICAL_EVENTS->value);
    }

    public function view(User $user, HistoricalEvent $event): bool
    {
        return $user->can(PermissionName::CAN_VIEW_HISTORICAL_EVENTS->value);
    }

    public function create(User $user): bool
    {
        return $user->can(PermissionName::CAN_CREATE_HISTORICAL_EVENTS->value);
    }

    public function update(User $user, HistoricalEvent $event): bool
    {
        return $user->can(PermissionName::CAN_UPDATE_HISTORICAL_EVENTS->value);
    }

    public function delete(User $user, HistoricalEvent $event): bool
    {
        return $user->can(PermissionName::CAN_DELETE_HISTORICAL_EVENTS->value);
    }
}
