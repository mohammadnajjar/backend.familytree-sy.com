<?php

namespace App\Enums\User;

use App\Enums\Base\EnumToArray;

enum UserStatus: int
{
    use EnumToArray;

    case ACTIVE = 1;
    case INACTIVE = 2;
}
