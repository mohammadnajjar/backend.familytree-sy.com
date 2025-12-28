<?php

namespace App\Http\Resources\Medium;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\User\UserLight;

class MediumDetails extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'createdBy',
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'url' => $this->url,
            'type' => $this->type,
            'for' => $this->for,
            'createdAt' => $this->created_at,
            'createdBy' => new UserLight($this->whenLoaded('createdBy')),
        ];
    }
}
