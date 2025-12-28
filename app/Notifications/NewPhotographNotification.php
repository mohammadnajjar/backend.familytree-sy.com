<?php

namespace App\Notifications;

use App\Enums\Notification\NotificationType;
use App\Models\Photograph;
use App\Notifications\Base\BaseNotification;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class NewPhotographNotification extends BaseNotification
{
    public function __construct(protected Photograph $photo) {}

    public function getType(): NotificationType
    {
        return NotificationType::NEW_PHOTOGRAPH;
    }

    public function getTitle(): string
    {
        return 'صورة جديدة';
    }

    public function getBody(): string
    {
        return "تمت إضافة صورة جديدة: {$this->photo->title}";
    }

    public function getEntityId(): ?int
    {
        return $this->photo->id;
    }

    public function getEntityType(): ?string
    {
        return Photograph::class;
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
