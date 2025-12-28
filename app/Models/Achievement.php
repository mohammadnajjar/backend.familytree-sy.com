<?php

namespace App\Models;

use App\Enums\Achievement\AchievementStatus;
use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class Achievement extends BaseModel
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'title',
        'content',
        'date',
        'status',
        'description',
        'image_id'
    ];

    protected $casts=[
        'status'=>AchievementStatus::class
    ];

    public function image(): BelongsTo
    {
        return $this->belongsTo(Medium::class, 'image_id');
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
}
