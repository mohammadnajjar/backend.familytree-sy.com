<?php

namespace App\Models;

use App\Enums\Photograph\PhotographStatus;
use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Photograph extends BaseModel
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'title',
        'description',
        'date',
        'status',
    ];

    protected $casts = [
        'status' => PhotographStatus::class
    ];

    public function images()
    {
        return $this->belongsToMany(
            Medium::class,
            'media_photographs',
            'photograph_id',
            'media_id')
            ->using(MediaPhotograph::class);
    }

    public function notificaions()
    {
        return $this->morphMany(Notification::class, 'entity');
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
