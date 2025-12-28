<?php

namespace App\Http\Requests\GeneralSetting;

use App\Http\Requests\Base\BaseFromRequest;

class GeneralSettingRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'nameFamily' => 'name_family',
    ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'PUT':
            case 'POST':
                return [
                    'nameFamily' => ['nullable', 'string'],
                    'box' => ['nullable', 'numeric'],
                ];
        }
    }
}
