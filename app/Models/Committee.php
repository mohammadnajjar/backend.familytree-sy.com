<?php

namespace App\Models;

use App\Enums\Committee\CommitteeStatus;
use App\Enums\Committee\MemberStatus;
use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Committee extends BaseModel
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'description',
        'start_at',
        'end_at',
        'status',
    ];

    protected $casts = [
        'status' => CommitteeStatus::class
    ];

    public function members()
    {
        return $this->belongsToMany(
            Member::class,
            'committee_members',
            'committee_id',
            'member_id'
        )->using(CommitteeMember::class)
            ->withPivot([
                'votes_count'
        ]);
    }

    public function notificaions()
    {
        return $this->morphMany(Notification::class, 'entity');
    }
}
