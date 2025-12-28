<?php

namespace App\Models;

use App\Models\Base\BaseModel;
use App\Models\Base\BasePivot;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class MediaPhotograph extends BasePivot
{
    use HasFactory,softDeletes;

    protected $table = 'media_photographs';

    protected $fillable=[
        'photograph_id',
        'media_id',
    ];
}
