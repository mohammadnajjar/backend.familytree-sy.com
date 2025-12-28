<?php

namespace App\Http\Requests\Committee;

use App\Enums\Committee\CommitteeStatus;
use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class CommitteeRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'startAt' => 'start_at',
        'endAt' => 'end_at',
    ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'PUT':
            case 'POST':
                return [
                    'name' => ['required', 'string', 'max:255'],
                    'description' => ['nullable', 'string'],
                    'startAt' => ['required', 'date'],
                    'endAt' => ['required', 'date', 'after_or_equal:startAt'],
                    'status' => ['required', Rule::in(CommitteeStatus::values())],
                    'permissions' => ['nullable', 'array'],
                    'permissions.*' => ['string', 'exists:permissions,name'],
                ];
        }
    }
}
