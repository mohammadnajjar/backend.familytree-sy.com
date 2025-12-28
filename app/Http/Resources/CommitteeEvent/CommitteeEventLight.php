<?php
namespace App\Http\Resources\CommitteeEvent;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Committee\CommitteeLight;

class CommitteeEventLight extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'committee',
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'committee' => new CommitteeLight($this->whenLoaded('committee')),
        ];
    }
}
