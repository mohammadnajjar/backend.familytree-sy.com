<?php

namespace App\Models;

use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class City extends BaseModel
{
    use HasFactory, SoftDeletes;


    protected $fillable = [
        'name',
    ];
}
