<?php

namespace App\Models;

use App\Enums\Donation\DonationStatus;
use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Donation extends BaseModel
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'message',
        'title',
        'description',
        'status',
        'amount',
    ];

    protected $casts=[
        'status'=>DonationStatus::class
    ];

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
