<?php

namespace App\Http\Resources\Node;

use App\Http\Resources\Base\BaseJsonResource;

class NodeLight extends BaseJsonResource
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
