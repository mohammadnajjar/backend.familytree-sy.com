<?php

namespace App\Http\Resources\Notification;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Committee\CommitteeDetails;
use App\Http\Resources\CommitteeEvent\CommitteeEventDetails;
use App\Http\Resources\HistoricalEvent\HistoricalEventDetails;
use App\Http\Resources\Member\CandidateDetails;
use App\Http\Resources\Member\CandidateList;
use App\Http\Resources\Photograph\PhotographDetails;
use App\Models\Committee;
use App\Models\CommitteeEvent;
use App\Models\CommitteeMember;
use App\Models\HistoricalEvent;
use App\Models\Photograph;

class NotificationList extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'entity'
        ];
    }

    public function toArray($request): array
    {
        $targetResource = null;
        if ($this->relationLoaded('entity')) {
            switch ($this->entity_type) {
                case Committee::class:
                    $targetResource = new CommitteeDetails($this->entity);
                    break;
                case Photograph::class:
                    $targetResource = new PhotographDetails($this->entity);
                    break;
                case HistoricalEvent::class:
                    $targetResource = new HistoricalEventDetails($this->entity);
                    break;
                case CommitteeMember::class:
                    $targetResource = new CandidateList($this->entity);
                    break;
                case CommitteeEvent::class:
                    $targetResource = new CommitteeEventDetails($this->entity);
                    break;
            }
        }

        return [
            'id' => $this->id,
            'title' => $this->title,
            'body' => $this->body,
            'isSeen' => (bool) $this->is_seen,
            'date' => $this->date ? $this->date->toDateTimeString() : null,
            'createdAt' => $this->created_at->toDateTimeString(),
            'type'=>$this->type,
            'entityModel' => $targetResource,
            'entity_type' => $this->entity_type,
            'entity_id' => $this->entity_id,

        ];
    }
}
