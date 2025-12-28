<?php

namespace App\Enums\Committee;

use App\Enums\Base\EnumToArray;

enum MemberStatus: int
{
    use EnumToArray;

    case APPROVED = 1;
    case REJECTED = 2;
    case WAITING = 3;
}
