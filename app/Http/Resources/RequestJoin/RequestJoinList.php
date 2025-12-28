<?php

namespace App\Http\Resources\RequestJoin;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\City\CityLight;
use App\Http\Resources\Medium\MediumDetails;
use App\Http\Resources\Medium\MediumLight;
use App\Http\Resources\User\UserDetails;

class RequestJoinList extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'user',
            'city',
            'certificates'
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->user_id,
            'fatherName' => $this->father_name,
            'motherName' => $this->mother_name,
            'gender' => $this->gender,
            'birthDate' => $this->birth_date,
            'healthStatus' => $this->health_status,
            'work' => $this->work,
            'numberOfFamilyMembers' => $this->number_of_family_members,
            'personsKnow' => $this->persons_know,
            'status' => $this->status,
            'bloodType' => $this->blood_type,
            'maritalStatus' => $this->marital_status,
            'user' => new UserDetails($this->whenLoaded('user')),
            'city' => new CityLight($this->whenLoaded('city')),
            'certificates' => MediumLight::collection(($this->whenLoaded('certificates'))),
        ];
    }
}
