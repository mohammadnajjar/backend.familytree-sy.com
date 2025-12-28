<?php

namespace App\Filters;


use App\Filters\Main\BaseFilter;
use Illuminate\Database\Eloquent\Builder;


class RequestJoinFilter extends BaseFilter
{
   protected function attributesMap(): array
   {
        return [
            'fatherName'=>'father_name',
            'motherName'=>'mother_name',
            'work',
            'gender',
            'birthDate'=>'birth_date',
            'healthStatus'=>'health_status',
            'numberOfFamilyMembers'=>'number_of_family_members',
            'bloodType'=>'blood_type',
            'maritalStatus'=>'marital_status',
            'cityId'=>'city_id',
            'status' => 'status',
        ];
   }

    protected function search(Builder $builder, string $keyword): Builder
    {
        return $builder->where(function ($query) use ($keyword) {
            $query->where('members.father_name', 'like', "%{$keyword}%")
                ->orWhere('members.mother_name', 'like', "%{$keyword}%")
                ->orWhere('members.work', 'like', "%{$keyword}%")
                ->orWhereHas('user', function ($q) use ($keyword) {
                    $q->where('full_name', 'like', "%{$keyword}%")
                        ->orWhere('mobile', 'like', "%{$keyword}%");
                });
        });
    }



   function defaultOrder(Builder $builder): Builder
   {
        return parent::addOrder($builder, 'id');
   }

   protected function TableName(): string
   {
        return 'members';
   }

}
