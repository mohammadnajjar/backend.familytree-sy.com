<?php

namespace App\Notifications;

use App\Enums\Notification\NotificationType;
use App\Models\Committee;
use App\Notifications\Base\BaseNotification;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class NewCommitteeNotification extends BaseNotification
{
    public function __construct(protected Committee $committee) {}

    public function getType(): NotificationType
    {
        return NotificationType::NEW_COMMITTEE;
    }

    public function getTitle(): string
    {
        return 'لجنة جديد';
    }

    public function getBody(): string
    {
        return "تم إنشاء لجنة جديدة: {$this->committee->name}";
    }
    public function getEntityId(): ?int
    {
        return $this->committee->id;
    }

    public function getEntityType(): ?string
    {
        return Committee::class;
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
