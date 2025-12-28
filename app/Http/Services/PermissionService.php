<?php

namespace App\Http\Services;

use App\Http\Services\Base\CrudService;
use Spatie\Permission\Models\Permission;


class PermissionService extends CrudService
{
    protected function getModelClass(): string
    {
        return Permission::class;
    }
}
