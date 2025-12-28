<?php

namespace App\Http\Resources\Photograph;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Medium\MediumLight;

class PhotographDetails extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'images'
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'description' => $this->description,
            'date' => $this->date,
            'status' => $this->status,
            'images' => MediumLight::collection($this->whenLoaded('images')),
        ];
    }
}
