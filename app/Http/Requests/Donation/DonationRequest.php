<?php

namespace App\Http\Requests\Donation;

use App\Enums\Donation\DonationStatus;
use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class DonationRequest extends BaseFromRequest
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
                    'message'=>['required', 'string'],
                    'title'=>['nullable', 'string'],
                    'description'=>['nullable', 'string'],
                    'amount'=>['required', 'numeric'],
                ];
            case 'PUT':
                return [
                    'message'=>['nullable', 'string'],
                    'title'=>['nullable', 'string'],
                    'description'=>['nullable', 'string'],
                    'amount'=>['nullable', 'numeric'],
                    'status'=>['required', Rule::in(DonationStatus::values())],
                ];
        }
    }
}
