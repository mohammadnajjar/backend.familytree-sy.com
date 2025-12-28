<?php

namespace App\Http\Requests\Medium;

use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;

class FileExistRequest extends BaseFromRequest
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
                    'fileId' => ['required', Rule::exists('media', 'id')],
                ];
            case 'PUT':
                return [
                    //
                ];
        }
    }
}
