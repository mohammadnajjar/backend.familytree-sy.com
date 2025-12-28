<?php

namespace App\Http\Requests\Node;

use App\Enums\Member\BloodType;
use App\Enums\Member\Gender;
use App\Enums\Member\MaritalStatus;
use App\Enums\Node\NodeType;
use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class
NodeRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'parentId' => 'parent_id',
        'fullName' => 'full_name',
        'birthDate' => 'birth_date',
        'deathDate' => 'death_date',
        'birthPlace' => 'birth_place',
        'deathPlace' => 'death_place',
        'fatherName' => 'father_name',
        'motherName' => 'mother_name',
        'healthStatus' => 'health_status',
        'numberOfFamilyMembers' => 'number_of_family_members',
        'personsKnow' => 'persons_know',
        'bloodType' => 'blood_type',
        'maritalStatus' => 'marital_status',
        'cityId' => 'city_id',
        'familyName' => 'family_name',
        'certificates' => 'certificates',
    ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'PUT':
            case 'POST':
                return [
                    'parentId' => ['nullable', 'exists:nodes,id'],
                    'type' => ['required', Rule::in(NodeType::values())],
                    'fullName' => ['nullable', 'string', 'max:255'],
                    'birthDate' => ['nullable', 'date'],
                    'deathDate' => ['nullable', 'date'],
                    'birthPlace' => ['nullable', 'string', 'max:255'],
                    'deathPlace' => ['nullable', 'string', 'max:255'],
                    'fatherName' => ['nullable', 'string', 'max:255'],
                    'motherName' => ['nullable', 'string', 'max:255'],
                    'gender' => ['nullable', Rule::in(Gender::values())],
                    'healthStatus' => ['nullable', 'string', 'max:255'],
                    'work' => ['nullable', 'string', 'max:255'],
                    'numberOfFamilyMembers' => ['nullable', 'integer', 'min:0'],
                    'personsKnow' => ['nullable', 'array'],
                    'status' => ['nullable', 'string', 'max:255'],
                    'bloodType' => ['nullable', Rule::in(BloodType::values())],
                    'maritalStatus' => ['nullable', Rule::in(MaritalStatus::values())],
                    'cityId' => ['nullable', 'exists:cities,id'],
                    'familyName' => ['nullable', 'string', 'max:255'],
                    'certificates' => ['nullable', 'array'],
                    'certificates.*' => ['exists:media,id'],
                ];
        }
    }
}
