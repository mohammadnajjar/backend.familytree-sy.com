<?php

namespace App\Enums\Photograph;

use App\Enums\Base\EnumToArray;

enum PhotographStatus: int
{
    use EnumToArray;

    case APPROVED = 1;
    case REJECTED = 2;
    case WAITING = 3;
}
