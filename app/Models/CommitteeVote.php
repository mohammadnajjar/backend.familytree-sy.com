<?php

namespace App\Models;

use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class CommitteeVote extends BaseModel
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'committee_id',
        'voter_id',
        'candidate_id',
    ];

    public function candidate()
    {
        return $this->belongsTo(Member::class, 'candidate_id');
    }
}
