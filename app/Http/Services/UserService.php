<?php

namespace App\Http\Services;

use App\Enums\Member\MemberStatus;
use App\Models\JoinRequestReview;
use App\Models\Member;
use App\Models\User;
use App\Http\Services\Base\CrudService;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class UserService extends CrudService
{
    protected function getModelClass(): string
        {
            return User::class;
        }


}
