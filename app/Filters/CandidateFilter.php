<?php

namespace App\Filters;


use App\Filters\Main\BaseFilter;
use Illuminate\Database\Eloquent\Builder;


class CandidateFilter extends BaseFilter
{
   protected function attributesMap(): array
   {
        return [
            'status',
            'votesCount'=>'votes_count',
            'committeeId'=>'committee_id',
            'memberId'=>'member_id',
        ];
   }

    protected function search(Builder $builder, string $keyword): Builder
    {
        return $builder->where(function ($query) use ($keyword) {
            $query
                ->whereHas('member', function ($memberQuery) use ($keyword) {
                    $memberQuery->where(function ($q) use ($keyword) {
                        $q->where('father_name', 'like', "%{$keyword}%")
                            ->orWhere('mother_name', 'like', "%{$keyword}%")
                            ->orWhere('work', 'like', "%{$keyword}%");
                    })
                        ->orWhereHas('user', function ($userQuery) use ($keyword) {
                            $userQuery->where('name', 'like', "%{$keyword}%");
                        });
                })
                ->orWhereHas('committee', function ($committeeQuery) use ($keyword) {
                    $committeeQuery->where(function ($q) use ($keyword) {
                        $q->where('name', 'like', "%{$keyword}%")
                            ->orWhere('description', 'like', "%{$keyword}%");
                    });
                });
        });
    }


    function defaultOrder(Builder $builder): Builder
   {
        return parent::addOrder($builder, 'id');
   }

   protected function TableName(): string
   {
        return 'committee_members';
   }

}
