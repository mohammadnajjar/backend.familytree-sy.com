<?php

namespace App\Notifications;

use App\Enums\Notification\NotificationType;
use App\Models\HistoricalEvent;
use App\Notifications\Base\BaseNotification;

class NewEventNotification extends BaseNotification
{
    public function __construct(protected HistoricalEvent $event) {}

    public function getType(): NotificationType
    {
        return NotificationType::NEW_EVENT;
    }

    public function getTitle(): string
    {
        return 'حدث جديد';
    }

    public function getBody(): string
    {
        return "تم إنشاء حدث جديد: {$this->event->title}";
    }

    public function getEntityId(): ?int
    {
        return $this->event->id;
    }

    public function getEntityType(): ?string
    {
        return HistoricalEvent::class;
    }

    public function via($notifiable): array
    {
        return ['database'];
    }

    public function toArray($notifiable): array
    {
        return $this->getData();
    }
}
