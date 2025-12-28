<?php

namespace App\Enums\Medium;

use App\Enums\Base\EnumToArray;

enum MediumType: int
{
    use EnumToArray;

    case Image = 1;
    case file = 2;
}
