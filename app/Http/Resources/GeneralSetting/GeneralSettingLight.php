<?php

namespace App\Http\Resources\GeneralSetting;

use App\Http\Resources\Base\BaseJsonResource;

class GeneralSettingLight extends BaseJsonResource
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
