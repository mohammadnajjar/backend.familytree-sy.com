<?php

namespace App\Http\Resources\Notification;

use App\Http\Resources\Base\BaseJsonResource;

class NotificationDetails extends BaseJsonResource
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
            'title' => $this->title,
            'body' => $this->body,
            'isSeen' => (bool) $this->is_seen,
            'date' => $this->date ? $this->date->toDateTimeString() : null,
            'createdAt' => $this->created_at->toDateTimeString(),
        ];
    }
}
