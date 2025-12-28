<?php

namespace App\Http\Resources\City;

use App\Http\Resources\Base\BaseJsonResource;

class CityLight extends BaseJsonResource
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
            'name' => $this->name
        ];
    }
}
