<?php

namespace App\Enums\Committee;

use App\Enums\Base\EnumToArray;

enum CommitteeStatus: int
{
    use EnumToArray;

    case ACTIVE = 1;
    case INACTIVE = 2;
}
