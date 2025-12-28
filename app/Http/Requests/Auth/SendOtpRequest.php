<?php

namespace App\Http\Requests\Auth;

use App\Http\Requests\Base\BaseFromRequest;
use App\Rules\MobileOtpRule;

class SendOtpRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        //'userId' => 'user_id',
    ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'POST':
                return [
                    'mobile' => ['required', new MobileOtpRule()],
                    'signature' => ['nullable', 'string'],
                ];
            case 'PUT':
                return [
                    //
                ];
        }
    }
    

    protected function passedValidation(): void
    {
        $mobile = substr($this->mobile, 1);
        $this->replace(['mobile' => $mobile]);
    }
}
