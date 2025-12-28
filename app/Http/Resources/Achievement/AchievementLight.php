<?php

namespace App\Http\Resources\Achievement;

use App\Http\Resources\Base\BaseJsonResource;

class AchievementLight extends BaseJsonResource
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
