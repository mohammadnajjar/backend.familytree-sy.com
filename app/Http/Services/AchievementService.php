<?php

namespace App\Http\Services;

use App\Filters\Main\BaseFilter;
use App\Models\Achievement;
use App\Http\Services\Base\CrudService;


class AchievementService extends CrudService
{
    protected function getModelClass(): string
        {
            return Achievement::class;
        }

    public function getAll(
        ?BaseFilter $filter = null,
        bool        $withTrashed = false,
        ?string     $orderByColumn = 'created_at',
        ?string     $orderByDirection = 'desc'
    ): \Illuminate\Database\Eloquent\Builder
    {
        // Call the parent getAll method to get the base query
        $query = $this->getQuery($withTrashed);
        // Add the orderBy clause
        $query->orderBy($orderByColumn, $orderByDirection);
        return $filter->apply($query);
    }
}
