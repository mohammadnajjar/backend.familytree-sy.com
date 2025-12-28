<?php
namespace App\Http\Resources\CommitteeEvent;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Committee\CommitteeLight;
use App\Http\Resources\Medium\MediumLight;

class CommitteeEventDetails extends BaseJsonResource
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
            'content' => $this->content,
            'description' => $this->description,
            'date' => $this->date,
            'image' => new MediumLight($this->whenLoaded('image')),
            'committee' => new CommitteeLight($this->whenLoaded('committee')),
        ];
    }
}
