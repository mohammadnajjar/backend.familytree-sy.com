<?php

namespace App\Http\Requests\Donation;

use App\Enums\Donation\DonationStatus;
use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class AcceptDonationRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'donationId' => 'id',
    ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'PUT':
                return [
                    'donationId' => ['required', Rule::exists('donations','id')],
                    'status'=>['required', Rule::in(DonationStatus::values())],
                ];
        }
    }
}
