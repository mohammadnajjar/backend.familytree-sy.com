<?php

namespace App\Http\Resources\Permission;

use App\Http\Resources\Base\BaseJsonResource;

class PermissionList extends BaseJsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
        ];
    }
}
