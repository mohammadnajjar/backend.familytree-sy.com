<?php

namespace App\Http\Resources\User;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Medium\MediumLight;
use App\Http\Resources\Role\RoleList;

class UserDetails extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'roles.permissions',
            'image',
            'attachment',
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'fullName' => $this->full_name,
            'mobile' => $this->mobile,
            'image' => new MediumLight($this->whenLoaded('image')),
            'attachment' => new MediumLight($this->whenLoaded('attachment')),
            'roles' => RoleList::collection($this->whenLoaded('roles')),
        ];
    }
}
