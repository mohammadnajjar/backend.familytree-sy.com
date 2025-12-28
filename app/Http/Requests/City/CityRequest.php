<?php

namespace App\Http\Requests\City;

use App\Http\Requests\Base\BaseFromRequest;

class CityRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        //'userId' => 'user_id',
    ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'PUT':
            case 'POST':
                return [
                    'name' => ['required', 'string'],
                ];
        }
    }
}
