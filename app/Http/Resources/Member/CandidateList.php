<?php

namespace App\Http\Resources\Member;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\City\CityLight;
use App\Http\Resources\Committee\CommitteeLight;
use App\Http\Resources\Medium\MediumLight;
use App\Http\Resources\User\UserDetails;

class CandidateList extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'member',
            'member.user',
            'committee',
            'member.certificates',
        ];
    }

    public function toArray($request): array
    {
        return [
            'id'           => $this->id,
            'status'       => $this->status,
            'votesCount'  => $this->votes_count,

            'member' => new MemberLight($this->member),
            'committee' => new CommitteeLight($this->committee),
        ];
    }
}
