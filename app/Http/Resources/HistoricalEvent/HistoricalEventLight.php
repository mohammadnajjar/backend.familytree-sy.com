<?php

namespace App\Http\Resources\HistoricalEvent;

use App\Http\Resources\Base\BaseJsonResource;

class HistoricalEventLight extends BaseJsonResource
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

        ];
    }
}
