<?php

namespace App\Http\Requests\Auth;

use App\Enums\Member\BloodType;
use App\Enums\Member\Gender;
use App\Enums\Member\MaritalStatus;
use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class MemberMeRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'fullName' => 'full_name',
        'fatherName' => 'father_name',
        'motherName' => 'mother_name',
        'birthDate' => 'birth_date',
        'healthStatus' => 'health_status',
        'numberOfFamilyMembers' => 'number_of_family_members',
        'personsKnow' => 'persons_know',
        'bloodType' => 'blood_type',
        'maritalStatus' => 'marital_status',
        'cityId' => 'city_id',
        'work' => 'work',
        'gender' => 'gender',
        'imageId' => 'image_id',
        'certificateIds' => 'certificateIds',

    ];

    public function rules(): array
    {
        return [
            'fullName' => ['required', 'string'],
            'fatherName' => ['nullable', 'string'],
            'motherName' => ['nullable', 'string'],
            'birthDate' => ['nullable', 'date'],
            'healthStatus' => ['nullable', 'string'],
            'work' => ['nullable', 'string'],
            'numberOfFamilyMembers' => ['nullable', 'integer', 'min:1'],

            'personsKnow' => ['nullable', 'array'],
            'personsKnow.*' => ['string'],

            'gender' => ['nullable', Rule::in(Gender::values())],
            'bloodType' => ['nullable', Rule::in(BloodType::values())],
            'maritalStatus' => ['nullable', Rule::in(MaritalStatus::values())],

            'cityId' => ['nullable', 'exists:cities,id'],
            'imageId' => ['nullable', 'int', Rule::exists('media', 'id')],

            'certificateIds' => ['nullable', 'array'],
            'certificateIds.*' => ['integer', Rule::exists('media', 'id')],

        ];
    }
}
