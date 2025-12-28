<?php

namespace App\Http\Resources\Member;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Medium\MediumLight;
use App\Http\Resources\User\UserDetails;
use App\Http\Resources\User\UserLight;

class MemberLight extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'user',
            'certificates'
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'fatherName' => $this->father_name,
            'motherName' => $this->mother_name,
            'gender' => $this->gender,
            'birthDate' => $this->birth_date,
            'deathDate' => $this->death_date,
            'healthStatus' => $this->health_status,
            'work' => $this->work,
            'numberOfFamilyMembers' => $this->number_of_family_members,
            'personsKnow' => $this->persons_know,
            'status' => $this->status,
            'bloodType' => $this->blood_type,
            'maritalStatus' => $this->marital_status,

            'user' => new UserLight($this->whenLoaded('user')),
            'certificates' => MediumLight::collection(($this->whenLoaded('certificates'))),

        ];
    }
}
