<?php

namespace App\Models;

use App\Enums\Committee\MemberStatus;
use App\Models\Base\BasePivot;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class CommitteeMember extends BasePivot
{
    use HasFactory, SoftDeletes;

    protected $table = 'committee_members';
    protected $fillable=[
        'committee_id',
        'member_id',
        'start_at',
        'end_at',
        'status',
        'votes_count'
    ];

    protected $casts=[
        'status'=>MemberStatus::class
    ];


    public function member()
    {
        return $this->belongsTo(Member::class, 'member_id');
    }

    public function committee()
    {
        return $this->belongsTo(Committee::class, 'committee_id');
    }


    public function notificaions()
    {
        return $this->morphMany(Notification::class, 'entity');
    }
}
