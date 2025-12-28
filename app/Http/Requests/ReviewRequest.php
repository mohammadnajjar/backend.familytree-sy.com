<?php

namespace App\Http\Requests;

use App\Http\Requests\Base\BaseFromRequest;

class ReviewRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'memberId' => 'member_id',
    ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'POST':
                return [
                    'memberId' => ['required', 'integer', 'exists:members,user_id'],
                    'approve' => ['required', 'boolean'],
                    'note' => ['nullable', 'string', 'max:1000'],
                ];
            case 'PUT':
                return [
                    //
                ];
        }
    }
}
