<?php

namespace App\Http\Requests\Node;

use App\Http\Requests\Base\BaseFromRequest;

class MatchPendingNodesRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'ancestorId' => 'ancestor_id',
        'parentId' => 'parent_id',
        'fullName' => 'full_name',
        'birthDate' => 'birth_date',
    ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'POST':
                return [
                    'ancestorId' => ['nullable', 'exists:nodes,id'],
                    'parentId' => ['nullable', 'exists:nodes,id'],
                    'fullName' => ['nullable', 'string', 'max:255'],
                    'birthDate' => ['nullable', 'date'],
                ];
            case 'PUT':
                return [
                    //
                ];
        }
    }
}
