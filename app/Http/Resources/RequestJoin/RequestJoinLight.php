<?php

namespace App\Http\Resources\RequestJoin;

use App\Http\Resources\Base\BaseJsonResource;

class RequestJoinLight extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'user'
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->user_id,
            'fullName' => $this->user?->full_name,
        ];
    }
}
