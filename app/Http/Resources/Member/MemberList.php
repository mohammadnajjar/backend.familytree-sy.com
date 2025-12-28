<?php

namespace App\Http\Resources\Member;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\City\CityLight;
use App\Http\Resources\Medium\MediumLight;
use App\Http\Resources\User\UserDetails;

class MemberList extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'user',
            'city',
            'certificates',
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'father_name' => $this->father_name,
            'fatherName' => $this->father_name,
            'motherName' => $this->mother_name,
            'gender' => $this->gender,
            'birthDate' => $this->birth_date,
            'deathDate' => $this->death_date,
            'birthPlace' => $this->birth_place,
            'deathPlace' => $this->death_place,
            'healthStatus' => $this->health_status,
            'work' => $this->work,
            'numberOfFamilyMembers' => $this->number_of_family_members,
            'personsKnow' => $this->persons_know,
            'status' => $this->status,
            'bloodType' => $this->blood_type,
            'maritalStatus' => $this->marital_status,
            'user' => new UserDetails($this->whenLoaded('user')),
            'city' => new CityLight($this->whenLoaded('city')),
        ];
    }
}
