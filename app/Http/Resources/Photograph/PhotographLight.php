<?php

namespace App\Http\Resources\Photograph;

use App\Http\Resources\Base\BaseJsonResource;

class PhotographLight extends BaseJsonResource
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
