<?php

namespace App\Http\Services;

use App\Models\CommitteeEvent;
use App\Http\Services\Base\CrudService;
use App\Filters\Main\BaseFilter;

class CommitteeEventService extends CrudService
{
    protected function getModelClass(): string
    {
        return CommitteeEvent::class;
    }

    public function getAll(
        ?BaseFilter $filter = null,
        bool $withTrashed = false,
        ?string $orderByColumn = 'created_at',
        ?string $orderByDirection = 'desc'
    ): \Illuminate\Database\Eloquent\Builder
    {
        $query = $this->getQuery($withTrashed);
        $query->orderBy($orderByColumn, $orderByDirection);
        return $filter ? $filter->apply($query) : $query;
    }

    public function getAllByCommitteeWithFilter(
        int $committeeId,
        ?BaseFilter $filter = null,
        bool $withTrashed = false,
        ?string $orderByColumn = 'created_at',
        ?string $orderByDirection = 'desc'
    ): \Illuminate\Database\Eloquent\Builder
    {
        $query = $this->getQuery($withTrashed)->where('committee_id', $committeeId);
        $query->orderBy($orderByColumn, $orderByDirection);
        return $filter ? $filter->apply($query) : $query;
    }


}
