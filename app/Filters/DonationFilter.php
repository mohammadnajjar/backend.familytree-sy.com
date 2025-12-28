<?php

namespace App\Filters;


use App\Filters\Main\BaseFilter;
use Illuminate\Database\Eloquent\Builder;


class DonationFilter extends BaseFilter
{
    protected function attributesMap(): array
    {
        return [
            'message',
            'title',
            'description',
            'status' ,
            'createdBy'=>'created_by'
        ];
    }

    protected function search(Builder $builder, string $keyword): Builder
    {
        $builder->where(function ($query) use ($keyword) {
            $query->orWhereRaw('LOWER(title) LIKE ?', ['%' . strtolower($keyword) . '%'])
                ->orWhereRaw('LOWER(message) LIKE ?', ['%' . strtolower($keyword) . '%'])
                ->orWhereRaw('LOWER(description) LIKE ?', ['%' . strtolower($keyword) . '%']);
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
