<?php

namespace App\Enums\Achievement;

use App\Enums\Base\EnumToArray;

enum AchievementStatus: int
{
    use EnumToArray;

    case APPROVED = 1;
    case REJECTED = 2;
    case WAITING = 3;
}
