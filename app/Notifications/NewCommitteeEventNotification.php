<?php

namespace App\Notifications;

use App\Enums\Notification\NotificationType;
use App\Models\CommitteeEvent;
use App\Notifications\Base\BaseNotification;

class NewCommitteeEventNotification extends BaseNotification
{
    public function __construct(protected CommitteeEvent $event) {}

    public function getType(): NotificationType
    {
        return NotificationType::NEW_COMMITTEE_EVENT;
    }

    public function getTitle(): string
    {
        return 'حدث لجنة جديد';
    }

    public function getBody(): string
    {
        return "تمت إضافة حدث لجنة جديد: {$this->event->title}";
    }

    public function getEntityId(): ?int
    {
        return $this->event->id;
    }

    public function getEntityType(): ?string
    {
        return CommitteeEvent::class;
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
