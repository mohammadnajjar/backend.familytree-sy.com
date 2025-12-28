<?php

namespace App\Http\Resources\Committee;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Member\MemberDetails;
use App\Http\Resources\Member\MemberLight;
use Spatie\Permission\Models\Role;

class CommitteeDetails extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'members'
        ];
    }

    public function toArray($request): array
    {
        $roleName = 'committee_' . $this->id;
        $role = Role::where('name', $roleName)->first();
        return [
            'id' => $this->id,
            'name' => $this->name,
            'description' => $this->description,
            'startAt' => $this->start_at,
            'endAt' => $this->end_at,
            'status' => $this->status,
            'permissions' => $role
                ? $role->permissions->pluck('name')
                : [],
            'members' => $this->whenLoaded('members', function () {
                return $this->members->map(function ($member) {
                    return [
                        ...(new MemberDetails($member))->toArray(request()),
                        'votesCount' => $member->pivot->votes_count ?? 0,
                    ];
                });
            }),
        ];
    }
}
