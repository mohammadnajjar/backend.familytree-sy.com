<?php

namespace App\Http\Requests\Committee;

use App\Enums\Committee\MemberStatus;
use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class VoteToCandidateRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'committeeId' => 'committee_id',
        'candidateId' => 'member_id',
        ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'POST':
                return [
                    'committeeId' => ['required', Rule::exists('committees','id')],
                    'candidateId' => ['required', Rule::exists('members','user_id')],
                    'status'=>['nullable', Rule::in(MemberStatus::values())],
                ];
            case 'PUT':
                return [
                    //
                ];
        }
    }
}
