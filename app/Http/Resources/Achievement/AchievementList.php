<?php

namespace App\Http\Resources\Achievement;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Medium\MediumLight;

class AchievementList extends BaseJsonResource
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
            'status'=>$this->status,
            'image' => new MediumLight($this->whenLoaded('image')),
        ];
    }
}
