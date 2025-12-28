<?php

namespace App\Http\Requests\Committee;

use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class ApplyToCommitteeRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'committeeId' => 'id',
        ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'POST':
                return [
                    'committeeId' => ['required', Rule::exists('committees','id')],
                ];
            case 'PUT':
                return [
                    //
                ];
        }
    }
}
