<?php

namespace App\Http\Requests\Node;

use App\Enums\Node\NodeType;
use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class LinkToParentRequest extends BaseFromRequest
{
    protected array $attributesMap = [
        'nodeId' => 'node_id',
        'parentId' => 'parent_id',
    ];

    public function rules(): array
    {
        switch (request()->method()) {
            default:
            case 'PUT':
            case 'POST':
                return [
                    'nodeId' => ['required', 'int', Rule::exists('nodes', 'id')],
                    'parentId' => ['nullable', 'int', Rule::exists('nodes', 'user_id')],
                ];
        }
    }
}
