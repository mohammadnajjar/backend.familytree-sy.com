<?php

namespace App\Http\Resources\Donation;

use App\Http\Resources\Base\BaseJsonResource;
use App\Http\Resources\User\UserLight;

class DonationDetails extends BaseJsonResource
{
    protected static function relations(): array
    {
        return [
        'createdBy'
        ];
    }

    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'message'=> $this->message,
            'title'=> $this->title,
            'description'=> $this->description,
            'amount'=> $this->amount,
            'status'=> $this->status,
            'createdBy' => new UserLight($this->whenLoaded('createdBy')),

        ];
    }
}
