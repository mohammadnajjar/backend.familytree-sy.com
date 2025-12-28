<?php

namespace App\Notifications;

use App\Enums\Notification\NotificationType;
use App\Models\Achievement;
use App\Notifications\Base\BaseNotification;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class NewAchievementNotification extends BaseNotification
{
    public function __construct(protected Achievement $achievement) {}

    public function getType(): NotificationType
    {
        return NotificationType::NEW_ACHIEVEMENT;
    }

    public function getTitle(): string
    {
        return 'إنجاز جديد';
    }

    public function getBody(): string
    {
        return "تمت إضافة إنجاز جديد: {$this->achievement->title}";
    }

    public function getEntityId(): ?int
    {
        return $this->achievement->id;
    }

    public function getEntityType(): ?string
    {
        return Achievement::class;
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
