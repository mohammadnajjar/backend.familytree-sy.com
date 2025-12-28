<?php

namespace App\Http\Resources\Donation;

use App\Http\Resources\Base\BaseJsonResource;

class DonationLight extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [

        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'message'=> $this->message,
            'amount'=> $this->amount,
        ];
    }
}
