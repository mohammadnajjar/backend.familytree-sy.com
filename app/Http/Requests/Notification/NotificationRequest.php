<?php

namespace App\Http\Requests\Notification;

use App\Http\Requests\Base\BaseFromRequest;

class NotificationRequest extends BaseFromRequest
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
                    //
                ];
            case 'PUT':
                return [
                    //
                ];
        }
    }
}
