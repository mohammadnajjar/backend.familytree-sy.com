<?php

namespace App\Models;

use App\Enums\Member\BloodType;
use App\Enums\Member\Gender;
use App\Enums\Member\MaritalStatus;
use App\Enums\Member\MemberStatus;
use App\Models\Base\BaseModel;
use App\Models\Medium;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\SoftDeletes;

class Member extends BaseModel
{
    use HasFactory, SoftDeletes;

    protected $primaryKey = 'user_id';

    public $incrementing = false;

    protected $table = 'members';

    protected $fillable = [
        'father_name',
        'mother_name',
        'gender',
        'birth_date',
        'death_date',
        'birth_place',
        'death_place',
        'health_status',
        'work',
        'number_of_family_members',
        'persons_know',
        'status',
        'blood_type',
        'marital_status',
        'user_id',
        'city_id',
        'family_name'
    ];

    protected $casts = [
        'persons_know' => 'array',
        'number_of_family_members' => 'integer',
        'status' => MemberStatus::class,
        'marital_status' => MaritalStatus::class,
        'blood_type' => BloodType::class,
        'gender' => Gender::class,
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function city(): BelongsTo
    {
        return $this->belongsTo(City::class);
    }

    public function node(): HasOne
    {
        return $this->hasOne(Node::class,'member_id');
    }

    public function votesReceived()
    {
        return $this->hasMany(CommitteeVote::class, 'candidate_id');
    }


    public function committees()
    {
        return $this->belongsToMany(
            Committee::class,
            'committee_members',
            'member_id',
            'committee_id'
        )->using(CommitteeMember::class);
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by')->withTrashed();
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by')->withTrashed();
    }

    public function deletedBy()
    {
        return $this->belongsTo(User::class, 'deleted_by')->withTrashed();
    }

    public function notificaions()
    {
        return $this->morphMany(Notification::class, 'entity');
    }

    public function certificates()
    {
        return $this->belongsToMany(Medium::class, 'member_certificates', 'member_id', 'media_id');
    }

}
