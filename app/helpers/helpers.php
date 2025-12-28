<?php

use App\Models\User;
use Illuminate\Database\Eloquent\Builder;


if (!function_exists('zeroFillNumber')) {
    function zeroFillNumber($number, $fieldLength)
    {
        // Use sprintf to format the number with leading zeros
        return sprintf('%0' . $fieldLength . 'd', $number);
    }
}

if (!function_exists('hashQuery')) {
    function hashQuery(Builder $query)
    {
        $querySql = $query->toSql();
        $queryBindings = $query->getBindings();
        $bindingsReplaced = vsprintf(str_replace('?', '%s', $querySql), $queryBindings);
        return md5($bindingsReplaced);
    }
}

if (!function_exists('getUserFullName')) {
    function getUserFullName($userId)
    {
        if ($userId instanceof User) {
            return $userId->first_name . ' ' . $userId->last_name;
        }
        $user = User::findOrFail($userId);
        return $user->first_name . ' ' . $user->last_name;
    }
}

if (!function_exists('getUserMobile')) {
    function getUserMobile($userId)
    {
        if ($userId instanceof User) {
            return $userId->mobile;
        }
        $user = User::findOrFail($userId);
        return $user->mobile;
    }
}



