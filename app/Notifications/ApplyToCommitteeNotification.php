<?php

namespace App\Notifications;

use App\Models\Committee;
use App\Models\CommitteeMember;
use App\Models\Member;
use App\Enums\Notification\NotificationType;
use App\Notifications\Base\BaseNotification;

class ApplyToCommitteeNotification extends BaseNotification
{
    protected CommitteeMember $committee;
    protected Member $member;

    public function __construct(CommitteeMember $committee, Member $member)
    {
        $this->committee = $committee;
        $this->member = $member;
    }

    public function getType(): NotificationType
    {
        return NotificationType::JOIN_MEMBER_TO_COMMITTEE;
    }

    public function getTitle(): string
    {
        return 'طلب انتساب إلى لجنة';
    }

    public function getBody(): string
    {
        return "قام {$this->member->user?->full_name} بطلب الانتساب إلى اللجنة: {$this->committee->committee->name}.";
    }

    public function getEntityId(): ?int
    {
        return $this->committee->id;
    }

    public function getEntityType(): ?string
    {
        return CommitteeMember::class;
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
