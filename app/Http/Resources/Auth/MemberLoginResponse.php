<?php

namespace App\Http\Resources\Auth;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\Member\MemberDetails;
use App\Http\Resources\Member\MemberLight;
use App\Http\Resources\User\UserDetails;


class MemberLoginResponse extends BaseJsonResource
{

    public function toArray($request): array
    {
        return [
            'token' => $this['token'],
//            'user' => new UserDetails($this['user']),
            'member' => new MemberDetails($this['member']),
        ];
    }
}
