<?php

namespace App\Http\Services;

use App\Models\Donation;
use App\Http\Services\Base\CrudService;


class DonationService extends CrudService
{
    protected function getModelClass(): string
        {
            return Donation::class;
        }
}
