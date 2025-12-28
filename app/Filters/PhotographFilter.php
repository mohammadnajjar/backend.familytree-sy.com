<?php

namespace App\Filters;


use App\Filters\Main\BaseFilter;
use Illuminate\Database\Eloquent\Builder;


class PhotographFilter extends BaseFilter
{
    protected function attributesMap(): array
    {
        return [
            'title',
            'description',
            'status',
            'createdBy' => 'created_by'
        ];
    }

    protected function search(Builder $builder, string $keyword): Builder
    {
        $builder->where(function ($query) use ($keyword) {
            $query->orWhereRaw('LOWER(title) LIKE ?', ['%' . strtolower($keyword) . '%'])
                ->orWhereRaw('LOWER(description) LIKE ?', ['%' . strtolower($keyword) . '%'])
                ->orWhereRaw('DATE(date) LIKE ?', ['%' . $keyword . '%']);
        });
        return $builder;
    }

    function defaultOrder(Builder $builder): Builder
    {
        return parent::addOrder($builder, 'id');
    }

    protected function TableName(): string
    {
        return '';
    }

}
