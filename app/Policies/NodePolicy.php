<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Node;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Enums\Permission\PermissionName;

class NodePolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {
        return $user->can(PermissionName::CAN_VIEW_ALL_NODES->value);
    }

    public function view(User $user, Node $node): bool
    {
        return $user->can(PermissionName::CAN_VIEW_NODES->value);
    }

    public function create(User $user): bool
    {
        return $user->can(PermissionName::CAN_CREATE_NODES->value);
    }

    public function update(User $user, Node $node): bool
    {
        return $user->can(PermissionName::CAN_UPDATE_NODES->value);
    }

    public function delete(User $user, Node $node): bool
    {
        return $user->can(PermissionName::CAN_DELETE_NODES->value);
    }
}
