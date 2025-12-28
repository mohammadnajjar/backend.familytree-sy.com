<?php

namespace App\Enums\User;

use App\Enums\Base\EnumToArray;

enum UserSlide: int
{
    use EnumToArray;
    case ALL_USERS = 1;
    case ROLE_USER = 2;
    case ONE_USER = 3;

}
