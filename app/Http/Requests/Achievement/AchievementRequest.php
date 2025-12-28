<?php

namespace App\Http\Requests\Achievement;

use App\Enums\Achievement\AchievementStatus;
use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class AchievementRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'imageId' => 'image_id',
    ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'POST':
                return [
                    'title'=>['required', 'string'],
                    'content'=>['required', 'string'],
                    'description'=>['required', 'string'],
                    'date'=>['required', 'date'],
                    'imageId' => ['required', 'int', Rule::exists('media', 'id')],
                ];
            case 'PUT':
                return [
                    'title'=>['required', 'string'],
                    'content'=>['required', 'string'],
                    'description'=>['required', 'string'],
                    'date'=>['required', 'date'],
                    'status'=>['nullable', Rule::in(AchievementStatus::values())],
                    'imageId' => ['nullable', 'int', Rule::exists('media', 'id')],
                ];
        }
    }
}
