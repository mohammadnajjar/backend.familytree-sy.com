<?php

namespace App\Http\Resources\Role;

use App\Http\Resources\Base\BaseJsonResource;

class RoleLight extends BaseJsonResource
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
