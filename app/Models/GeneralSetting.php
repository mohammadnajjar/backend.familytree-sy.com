<?php

namespace App\Models;

use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class GeneralSetting extends BaseModel
{
    use HasFactory;

    protected $fillable = [
        'name_family',
        'box',
    ];
}
