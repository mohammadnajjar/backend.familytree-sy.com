<?php

namespace App\Enums\Node;

use App\Enums\Base\EnumToArray;

enum NodeType: int
{
    use EnumToArray;

    case CHILD = 1;
    case WIFE = 2;
}
