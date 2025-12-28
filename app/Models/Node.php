<?php

namespace App\Models;

use App\Enums\Member\BloodType;
use App\Enums\Member\Gender;
use App\Enums\Member\MaritalStatus;
use App\Enums\Member\MemberStatus;
use App\Enums\Node\NodeType;
use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Node extends BaseModel
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'member_id',
        'parent_id',
        'type',
        'full_name',
        'birth_date',
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
        'blood_type',
        'marital_status',
        'city_id',
        'family_name'
    ];

    protected $casts=[
        'type'=>NodeType::class,
        'number_of_family_members' => 'integer',
        'marital_status' => MaritalStatus::class,
        'blood_type' => BloodType::class,
        'gender' => Gender::class,
        'persons_know' => 'array',
    ];

    public function isPending(): bool
    {
        return is_null($this->member_id);
    }

    public function member(): BelongsTo
    {
        return $this->belongsTo(Member::class, 'member_id');
    }

    public function city(): BelongsTo
    {
        return $this->belongsTo(City::class);
    }

    public function parent(): BelongsTo
    {
        return $this->belongsTo(self::class, 'parent_id');
    }

    public function children(): HasMany
    {
        return $this->hasMany(Node::class, 'parent_id')->with('children');
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
    public function certificates()
    {
        return $this->belongsToMany(Medium::class, 'node_certificates', 'node_id', 'media_id');
    }
}
