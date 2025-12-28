<?php

namespace App\Http\Resources\Node;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\City\CityLight;
use App\Http\Resources\Medium\MediumLight;
use App\Http\Resources\Member\MemberDetails;

class NodeDetails extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
            'member',
            'children',
            'city',
            'certificates',
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'type' => $this->type,
            'parentId' => $this->parent_id,
            'fullName' => $this->full_name,
            'birthDate' => $this->birth_date,
            'deathDate' => $this->death_date,
            'birthPlace' => $this->birth_place,
            'deathPlace' => $this->death_place,
            'fatherName' => $this->father_name,
            'motherName' => $this->mother_name,
            'familyName' => $this->family_name,
            'gender' => $this->gender,
            'healthStatus' => $this->health_status,
            'work' => $this->work,
            'numberOfFamilyMembers' => $this->number_of_family_members,
            'personsKnow' => $this->persons_know,
            'bloodType' => $this->blood_type,
            'maritalStatus' => $this->marital_status,
            'city' => new CityLight($this->whenLoaded('city')),
            'member' => new MemberDetails($this->whenLoaded('member')),
            'children' => NodeDetails::collection($this->whenLoaded('children')),
            'certificates' => MediumLight::collection(($this->whenLoaded('certificates'))),
        ];
    }
}
