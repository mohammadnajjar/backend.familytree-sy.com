<?php

namespace App\Http\Resources\User;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Medium\MediumLight;

class UserAdminDetails extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'image',
            'attachment',
        ];
    }

    public function toArray($request): array
    {
        return [
            'full_name' => $this->full_name,
            'email' => $this->email,
            'mobile' => $this->mobile,
            'status' => $this->status,
            'image' => new MediumLight($this->whenLoaded('image')),
            'attachment' => new MediumLight($this->whenLoaded('attachment')),
        ];
    }
}
