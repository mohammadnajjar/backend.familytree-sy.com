<?php

namespace App\Http\Requests\Auth;

use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class MeRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'fullName' => 'full_name',
        'imageId' => 'image_id',
    ];

    public function rules(): array
    {
        return [
            'fullName' => ['required', 'string'],
            'imageId' => ['nullable', 'int', Rule::exists('media', 'id')],
        ];
    }
}
