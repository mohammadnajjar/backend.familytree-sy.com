<?php

namespace App\Enums\Notification;

use App\Enums\Base\EnumToArray;

enum NotificationType: int
{
    use EnumToArray;

    case REQUEST_JOIN = 1;
    case REPLAY_ON_REQUEST_JOIN = 2;
    case NEW_EVENT = 3;
    case NEW_PHOTOGRAPH = 4;
    case NEW_ACHIEVEMENT = 5;
    case NEW_COMMITTEE = 6;
    case JOIN_MEMBER_TO_COMMITTEE = 7;
    case REPLAY_ON_JOIN_MEMBER_TO_COMMITTEE = 8;
    case NEW_COMMITTEE_EVENT = 9;

}
