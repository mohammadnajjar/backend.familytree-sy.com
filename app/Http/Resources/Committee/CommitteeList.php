<?php

namespace App\Http\Resources\Committee;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Member\MemberDetails;

class CommitteeList extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
        'members'
        ];
    }

    public function toArray($request): array
    {
        return [
            'id'          => $this->id,
            'name'        => $this->name,
            'description' => $this->description,
            'startAt'    => $this->start_at,
            'endAt'      => $this->end_at,
            'status'      => $this->status,
            'candidates'  => MemberDetails::collection($this->members),
        ];
    }
}
