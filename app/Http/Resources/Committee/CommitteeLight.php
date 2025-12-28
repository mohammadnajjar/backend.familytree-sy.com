<?php

namespace App\Http\Resources\Committee;

use App\Http\Resources\Base\BaseJsonResource;

class CommitteeLight extends BaseJsonResource
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
            'description' => $this->description,
            'startAt' => $this->start_at,
            'endAt' => $this->end_at,
            'status' => $this->status,

        ];
    }
}
