<?php

namespace App\Http\Requests\RequestJoin;

use App\Enums\Member\BloodType;
use App\Enums\Member\Gender;
use App\Enums\Member\MaritalStatus;
use App\Http\Requests\Base\BaseFromRequest;
use App\Rules\MobileOtpRule;
use App\Rules\mobileValidateRule;
use Illuminate\Validation\Rule;

class RequestJoinRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'fullName' => 'full_name',
        'fatherName' => 'father_name',
        'motherName' => 'mother_name',
        'mobile' => 'mobile',
        'personsKnow' => 'persons_know',
        //////////////
        'gender' => 'gender',
        'birthDate' => 'birth_date',
        'birthPlace' => 'birth_place',
        'healthStatus' => 'health_status',
        'work' => 'work',
        'numberOfFamilyMembers' => 'number_of_family_members',
        'bloodType' => 'blood_type',
        'maritalStatus' => 'marital_status',
        'cityId' => 'city_id',
        'attachmentId' => 'attachment_id',
        'certificates' => 'certificates',
        'familyName' => 'family_name'
    ];


    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'POST':
                return [
                    'fullName' => ['required', 'string'],
                    'fatherName' => ['required', 'string'],
                    'motherName' => ['required', 'string'],
                    'mobile' => ['required'
//                        , new mobileValidateRule()
                        , Rule::unique('users', 'mobile')->ignore(auth()->id())],
                    'personsKnow' => ['nullable', 'array'],
                    'personsKnow.*' => ['string'],
                    /////////////////
                    'gender' => ['required', Rule::in(Gender::values())],
                    'birthDate' => ['required', 'date'],
                    'healthStatus' => ['nullable', 'string'],
                    'work' => ['nullable', 'string'],
                    'numberOfFamilyMembers' => ['required', 'integer'],
                    'bloodType' => ['nullable', Rule::in(BloodType::values())],
                    'maritalStatus' => ['nullable', Rule::in(MaritalStatus::values())],
                    'cityId' => ['nullable', 'exists:cities,id'],
                    'fcm_token' => ['nullable', 'string'],
                    'password' => ['required', 'string', 'min:6', 'confirmed'],
                    'certificates' => ['nullable', 'array'],
                    'certificates.*' => ['exists:media,id'],
                    'attachmentId' => ['nullable', 'exists:media,id'],
                    'familyName' => ['nullable', 'string'],
                ];
            case 'PUT':
                return [
                    //
                ];
        }
    }
}
