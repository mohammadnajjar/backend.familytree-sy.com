<?php

namespace App\Models\Base;

use Illuminate\Database\Eloquent\Relations\Concerns\AsPivot;

class BasePivot extends BaseModel
{
    use AsPivot;

    public $incrementing = false;
    public $timestamps = false;

    protected $userstamping = false;
    protected $guarded = [];
}
