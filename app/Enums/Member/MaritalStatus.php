<?php

namespace App\Enums\Member;

use App\Enums\Base\EnumToArray;

enum MaritalStatus:int
{
    use EnumToArray;


    case Single = 1;
    case Married = 2;
    case Divorced = 3;
    case Widowed = 4;
}
