<?php

namespace App\Http\Resources\Role;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Permission\PermissionList;

class RoleList extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'permissions',
        ];
    }

    public function toArray($request): array
    {
        return [
            'id'          => $this->id,
            'name'        => $this->name,
            'permissions' => PermissionList::collection($this->whenLoaded('permissions')),
        ];
    }
}
