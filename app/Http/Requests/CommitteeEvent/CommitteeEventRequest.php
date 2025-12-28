<?php

namespace App\Http\Requests\CommitteeEvent;

use App\Enums\Achievement\AchievementStatus;
use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class CommitteeEventRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'imageId' => 'image_id',
        'committeeId' => 'committee_id',
    ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'POST':
                return [
                    'title' => ['required', 'string'],
                    'content' => ['required', 'string'],
                    'description' => ['required', 'string'],
                    'date' => ['required', 'date'],
                    'committeeId' => ['required', 'int', Rule::exists('committees', 'id')],
                    'imageId' => ['nullable', 'int', Rule::exists('media', 'id')],
                ];
            case 'PUT':
                return [
                    'title' => ['required', 'string'],
                    'content' => ['required', 'string'],
                    'description' => ['required', 'string'],
                    'date' => ['required', 'date'],
                    'status' => ['nullable', Rule::in(AchievementStatus::values())],
                    'committeeId' => ['required', 'int', Rule::exists('committees', 'id')],
                    'imageId' => ['nullable', 'int', Rule::exists('media', 'id')],
                ];
        }
    }
}
