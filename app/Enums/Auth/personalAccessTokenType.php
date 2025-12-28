<?php

namespace App\Enums\Auth;

use App\Enums\Base\EnumToArray;

enum personalAccessTokenType : int
{
    use EnumToArray;

    case admin = 1;
    case member = 2;

}
