<?php

namespace App\Notifications\Base;

use App\Enums\Notification\NotificationType;
use Illuminate\Notifications\Notification;
abstract class BaseNotification extends Notification
{
    public function getPriority(): string
    {
        return 'normal';
    }

    public function getTimeToLive(): int
    {
        return 241900;
    }

    abstract public function getType(): NotificationType;
    abstract public function getTitle(): string;
    abstract public function getBody(): string;

    public function getEntityId(): ?int
    {
        return null;
    }

    public function getEntityType(): ?string
    {
        return null;
    }

    public function getData(): array
    {
        return [
            'type' => $this->getType()->value,
            'title' => $this->getTitle(),
            'body' => $this->getBody(),
            'entity_id' => $this->getEntityId(),
            'entity_type' => $this->getEntityType(),
        ];
    }
}
