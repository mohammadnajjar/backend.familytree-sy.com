<?php

namespace App\Http\Services;

use App\Enums\Committee\MemberStatus;
use App\Filters\Main\BaseFilter;
use App\Http\Services\Base\CrudService;
use App\Models\CommitteeMember;
use Illuminate\Database\Eloquent\Builder;


class CommitteeMemberService extends CrudService
{
    protected function getModelClass(): string
        {
            return CommitteeMember::class;
        }

    public function getAllCommitteeCandidates(?BaseFilter $filter = null, bool $withTrashed = false): Builder
    {
        $query = $this->getQuery();
        $query
            ->where('status',MemberStatus::WAITING->value)
            ->with(['member','member.user', 'committee']);

        if ($withTrashed) {
            $query->withTrashed();
        }

        return $filter?->apply($query) ?? $query;
    }

}
