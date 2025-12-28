<?php

namespace App\Filters;


use App\Filters\Main\BaseFilter;
use App\Filters\Main\ICanGetAll;
use Illuminate\Database\Eloquent\Builder;


class CityFilter extends BaseFilter implements ICanGetAll
{
     protected function attributesMap(): array
     {
          return [
               'id',
               'name',

               'createdBy' => 'created_by',
               'updatedBy' => 'updated_by',
               'deletedBy' => 'deleted_by',
          ];
     }

     protected function search(Builder $builder, string $keyword): Builder
     {
          $builder->where(function ($query) use ($keyword) {
               $query->orWhereRaw('LOWER(name) LIKE ?', ['%' . strtolower($keyword) . '%']);
          });
          return $builder;
     }

    function defaultOrder(Builder $builder): Builder
    {
        return parent::addOrder($builder, 'id');
    }

     protected function TableName(): string
     {
          return 'cities';
     }
}
