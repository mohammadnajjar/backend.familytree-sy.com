<?php

namespace App\Http\Services;

use App\Models\City;
use App\Http\Services\Base\CrudService;


class CityService extends CrudService
{
    protected function getModelClass(): string
        {
            return City::class;
        }
}
