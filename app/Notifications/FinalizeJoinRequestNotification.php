<?php

namespace App\Notifications;

use App\Enums\Member\MemberStatus;
use App\Enums\Notification\NotificationType;
use App\Notifications\Base\BaseNotification;

class FinalizeJoinRequestNotification extends BaseNotification
{
    protected int $userId;
    protected MemberStatus $status;

    public function __construct(int $userId, MemberStatus $status)
    {
        $this->userId = $userId;
        $this->status = $status;
    }

    public function getType(): NotificationType
    {
        return NotificationType::REPLAY_ON_REQUEST_JOIN;
    }

    public function getTitle(): string
    {
        return 'تمت مراجعة طلب انضمامك';
    }

    public function getBody(): string
    {
        return $this->status === MemberStatus::APPROVED
            ? 'تم قبول طلب انضمامك بنجاح، يمكنك الآن استخدام النظام.'
            : 'نأسف، تم رفض طلب انضمامك.';
    }

    public function getEntityId(): ?int
    {
        return $this->userId;
    }

    public function getEntityType(): ?string
    {
        return \App\Models\Member::class;
    }
}
