<?php

namespace App\Http\Resources\HistoricalEvent;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Medium\MediumLight;

class HistoricalEventDetails extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'image'
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'title'=> $this->title,
            'content'=> $this->content,
            'description'=> $this->description,
            'date'=> $this->date,
            'image' => new MediumLight($this->whenLoaded('image')),
        ];
    }
}
