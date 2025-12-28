<?php

namespace App\Models;

use App\Enums\Notification\NotificationType;
use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Notification extends BaseModel
{
    use HasFactory;

    protected $fillable=[
        'type',
        'title',
        'body',
        'user_id',
        'topic_target',
        'date',
        'is_seen',
        'entity_type',
        'entity_id'
    ];

    protected $casts=[
        'type' => NotificationType::class,
    ];

    public function entity()
    {
        return $this->morphTo(__FUNCTION__, 'entity_type', 'entity_id')->withTrashed();
    }
}
