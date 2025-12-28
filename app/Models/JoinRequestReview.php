<?php

namespace App\Models;

use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JoinRequestReview extends Model
{
    use HasFactory;

    protected $fillable=[
        'join_request_id',
        'reviewer_id',
        'is_approved',
        'note'
    ];
}
