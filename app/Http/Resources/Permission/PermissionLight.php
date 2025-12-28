<?php

namespace App\Http\Resources\Permission;

use App\Http\Resources\Base\BaseJsonResource;

class PermissionLight extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [

        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
        ];
    }
}
