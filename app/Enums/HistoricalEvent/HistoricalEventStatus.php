<?php

namespace App\Enums\HistoricalEvent;

use App\Enums\Base\EnumToArray;

enum HistoricalEventStatus: int
{
    use EnumToArray;

    case APPROVED = 1;
    case REJECTED = 2;
    case WAITING = 3;
}
