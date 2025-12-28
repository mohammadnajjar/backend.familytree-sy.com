<?php

namespace App\Http\Requests\Auth;

use App\Http\Requests\Base\BaseFromRequest;
use App\Rules\mobileValidateRule;
use Illuminate\Validation\Rule;

class LoginRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        //'userId' => 'user_id',
    ];

    public function rules(): array
    {
        return [
            'mobile' => ['required', new mobileValidateRule()],
            'password' => ['required', 'string', 'min:6'],
            'fcm_token' => ['nullable', 'string']
        ];
    }

    protected function passedValidation(): void
    {
        if (!empty($this->mobile)) {
            $mobile = substr($this->mobile, 1);
            $this->merge(['mobile' => $mobile]);
        }
    }
}
