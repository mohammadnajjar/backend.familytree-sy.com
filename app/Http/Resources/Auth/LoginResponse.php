<?php

namespace App\Http\Resources\Auth;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\User\UserDetails;


class LoginResponse extends BaseJsonResource
{

    public function toArray($request): array
    {
        return [
            'token' => $this['token'],
            'user' => new UserDetails($this['user']),
        ];
    }
}
