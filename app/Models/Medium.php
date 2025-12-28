<?php

namespace App\Models;

use App\Enums\Medium\MediumFor;
use App\Enums\Medium\MediumType;
use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\Storage;

class Medium extends BaseModel
{
    use HasFactory;
    public const UPDATED_AT = null;
    public const UPDATED_BY = null;
    public const CREATED_BY = null;

    protected $fillable = [
        'id', 'path', 'extension', 'for', 'type',
    ];

    protected $casts = [
        'for' => MediumFor::class,
        'type' => MediumType::class
    ];

    protected function url(): Attribute
    {
        return Attribute::make(
            get: function ($value) {
                if (!Storage::disk('public')->exists($this->path)) {
//                    return 'https://picsum.photos/800/800?' . random_int(0, 1000);
                    return asset('_81284e3b-18a9-46f4-aa14-d2df754fc8cb.jpg');
                }
                return asset(Storage::url($this->path));
            },
        );
    }

    public function photographs()
    {
        return $this->belongsToMany(
            Photograph::class,
            'media_photographs',
            'media_id',
            'photograph_id')
            ->using(MediaPhotograph::class);
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by')->withTrashed();
    }

    public function users()
    {
        return $this->hasMany(User::class, 'image_id');
    }

    public function achievement()
    {
        return $this->hasMany(Achievement::class, 'image_id');
    }
    public function historicalEvent()
    {
        return $this->hasMany(HistoricalEvent::class, 'image_id');
    }

    public function membersWithCertificate()
    {
        return $this->belongsToMany(Member::class, 'member_certificates');
    }public function nodesWithCertificate()
    {
        return $this->belongsToMany(Member::class, 'node_certificates');
    }

}
