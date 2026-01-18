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
            'member',
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'fullName' => $this->full_name,
            'firstName' => $this->first_name,
            'lastName' => $this->last_name,
            'mobile' => $this->mobile,
            'phone' => $this->phone,
            'email' => $this->email,
            'note' => $this->note,
            'status' => $this->status,
            'image' => $this->image ? new MediumLight($this->image) : null,
            'attachment' => $this->attachment ? new MediumLight($this->attachment) : null,
            'roles' => RoleList::collection($this->whenLoaded('roles')),
            'member' => $this->whenLoaded('member', function() {
                return $this->member ? [
                    'id' => $this->member->user_id,
                    'address' => $this->member->address,
                ] : null;
            }),
            'createdAt' => $this->created_at,
            'updatedAt' => $this->updated_at,
        ];
    }
}
