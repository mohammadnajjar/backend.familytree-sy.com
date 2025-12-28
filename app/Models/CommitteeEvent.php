<?php

namespace App\Models;

use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class CommitteeEvent extends BaseModel
{
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'title', 'content', 'description', 'date',
        'committee_id', 'image_id'
    ];

    public function committee()
    {
        return $this->belongsTo(Committee::class);
    }

    public function image()
    {
        return $this->belongsTo(Medium::class, 'image_id');
    }
}
