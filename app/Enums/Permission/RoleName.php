<?php

namespace App\Enums\Permission;

use App\Enums\Base\EnumToArray;

enum RoleName: string
{
    use EnumToArray;

    case ADMIN = 'admin';
    case MEMBER = 'member';
}
