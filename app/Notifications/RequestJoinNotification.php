<?php

namespace App\Notifications;

use App\Enums\Notification\NotificationType;
use App\Notifications\Base\BaseNotification;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class RequestJoinNotification extends BaseNotification
{
    use Queueable;

    protected int $memberId;

    public function __construct(int $memberId)
    {
        $this->memberId = $memberId;
    }

    public function getType(): NotificationType
    {
        return NotificationType::REQUEST_JOIN;
    }

    public function getTitle(): string
    {
        return 'طلب انتساب جديد';
    }

    public function getBody(): string
    {
        return 'تم تقديم طلب انتساب جديد من قبل أحد المستخدمين.';
    }

    public function getEntityId(): ?int
    {
        return $this->memberId;
    }

    public function getEntityType(): ?string
    {
        return \App\Models\Member::class;
    }

    public function via($notifiable): array
    {
        return ['database']; // or []
    }

    public function toArray($notifiable): array
    {
        return $this->getData();
    }
}
