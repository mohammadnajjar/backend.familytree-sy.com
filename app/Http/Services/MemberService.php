<?php

namespace App\Http\Services;

use App\Enums\Member\MemberStatus;
use App\Filters\Main\BaseFilter;
use App\Http\Services\Base\CrudService;
use App\Models\CommitteeMember;
use App\Models\Member;
use Illuminate\Database\Eloquent\Builder;


class MemberService extends CrudService
{
    protected function getModelClass(): string
        {
            return Member::class;
        }

    public function getAllCommitteeCandidates(?BaseFilter $filter = null, bool $withTrashed = false): Builder
    {
        $query = CommitteeMember::query()
            ->with(['member','member.user', 'committee']);

        if ($withTrashed) {
            $query->withTrashed();
        }

        return $filter?->apply($query) ?? $query;
    }



    public function getAllMember(?BaseFilter $filter = null, bool $withTrashed = false): Builder
    {
        $query = $this->getQuery($withTrashed);
        $query->where('status',MemberStatus::APPROVED->value);
//        whereHas node
        return $filter->apply($query);

    }
}
