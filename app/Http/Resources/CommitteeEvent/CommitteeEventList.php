<?php
namespace App\Http\Resources\CommitteeEvent;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Committee\CommitteeLight;
use App\Http\Resources\Medium\MediumLight;

class CommitteeEventList extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'image',
            'committee',
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'description' => $this->description,
            'date' => $this->date,
            'image' => $this->image ? new MediumLight($this->image) : null,
            'committee' => new CommitteeLight($this->whenLoaded('committee')),
        ];
    }
}
