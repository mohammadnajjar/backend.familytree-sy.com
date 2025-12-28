<?php

namespace App\Filters;


use App\Filters\Main\BaseFilter;
use Illuminate\Database\Eloquent\Builder;


class CommitteeFilter extends BaseFilter
{
   protected function attributesMap(): array
   {
        return [
            'name' ,
            'description' ,
            'status'
        ];
   }

   protected function search(Builder $builder, string $keyword): Builder
   {
       $builder->where(function ($query) use ($keyword) {
           $query
               ->orWhereRaw('LOWER(name) LIKE ?', ['%' . strtolower($keyword) . '%'])
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
