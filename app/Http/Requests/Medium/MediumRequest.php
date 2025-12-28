<?php

namespace App\Http\Requests\Medium;

use App\Enums\Medium\MediumFor;
use App\Enums\Medium\MediumType;
use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class MediumRequest extends BaseFromRequest
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
                    'medium' => ['required', 'file'],
                    'type' => ['required', Rule::in(MediumType::values())],
                    'for' => ['required', Rule::in(MediumFor::values())]
                ];
            case 'PUT':
                return [
                    //
                ];
        }
    }
}
