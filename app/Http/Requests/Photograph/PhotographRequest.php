<?php

namespace App\Http\Requests\Photograph;

use App\Enums\Photograph\PhotographStatus;
use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class PhotographRequest extends BaseFromRequest
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
                    'title'       => ['nullable', 'string', 'max:255'],
                    'description' => ['nullable', 'string'],
                    'date'        => ['nullable', 'date'],
                    'imageIds' => ['array', 'required'],
                    'imageIds.*' => ['nullable', Rule::exists('media', 'id')]
                ];
            case 'PUT':
                return [
                    'title'       => ['nullable', 'string', 'max:255'],
                    'description' => ['nullable', 'string'],
                    'date'        => ['nullable', 'date'],
                    'status'      => ['nullable', Rule::in(PhotographStatus::values())],
                    'imageIds' => ['array'],
                    'imageIds.*' => ['nullable', Rule::exists('media', 'id')]
                ];
        }
    }
}
