<?php

namespace App\Enums\Medium;

use App\Enums\Base\EnumToArray;

enum MediumFor: string
{
    use EnumToArray;
    case UserProfile = 'user-profile';
    case Photograph = 'photograph';
    case Achievement = 'achievement';
    case HistoricalEvent = 'historical-event';
    case Certificate = 'certificate';
    case CommitteeEvent = 'committee-event';
    case Content = 'content';
}
