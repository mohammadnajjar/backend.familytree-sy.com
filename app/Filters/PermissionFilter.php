<?php

namespace App\Filters;

use App\Filters\Main\BaseFilter;
use App\Filters\Main\ICanGetAll;
use Illuminate\Database\Eloquent\Builder;

class PermissionFilter extends BaseFilter  implements ICanGetAll
{
    protected function attributesMap(): array
    {
        return [
            'name'
        ];
    }

    protected function search(Builder $builder, string $keyword): Builder
    {
        return $builder;
    }

    function defaultOrder(Builder $builder): Builder
    {
        return $builder;
    }

    protected function TableName(): string
    {
        return 'permissions';
    }
}
