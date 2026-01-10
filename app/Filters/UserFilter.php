<?php

namespace App\Filters;

use App\Filters\Main\BaseFilter;
use Illuminate\Database\Eloquent\Builder;

class UserFilter extends BaseFilter
{
    protected function attributesMap(): array
    {
        return [
            'fullName' => 'full_name',
            'mobile',
            'email',
            'status',
        ];
    }

    protected function search(Builder $builder, string $keyword): Builder
    {
        $builder->where(function ($query) use ($keyword) {
            $query->orWhereRaw('LOWER(full_name) LIKE ?', ['%' . strtolower($keyword) . '%'])
                ->orWhereRaw('LOWER(mobile) LIKE ?', ['%' . strtolower($keyword) . '%'])
                ->orWhereRaw('LOWER(email) LIKE ?', ['%' . strtolower($keyword) . '%']);
        });
        return $builder;
    }

    function defaultOrder(Builder $builder): Builder
    {
        return parent::addOrder($builder, 'id');
    }

    protected function TableName(): string
    {
        return 'users';
    }
}
