<?php

namespace App\Http\Resources\User;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Medium\MediumLight;

class UserList extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'roles',
            'image',
            'member',
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'fullName' => $this->full_name,
            'mobile' => $this->mobile,
            'email' => $this->email,
            'status' => $this->status,
            'image' => new MediumLight($this->whenLoaded('image')),
            'roles' => $this->whenLoaded('roles', fn() => $this->roles->pluck('name')),
            'hasMember' => $this->whenLoaded('member', fn() => $this->member !== null, false),
            'createdAt' => $this->created_at,
        ];
    }
}
