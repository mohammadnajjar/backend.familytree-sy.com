<?php

namespace App\Enums\Donation;

use App\Enums\Base\EnumToArray;

enum DonationStatus: int
{
    use EnumToArray;

    case APPROVED = 1;
    case REJECTED = 2;
    case WAITING = 3;
}
