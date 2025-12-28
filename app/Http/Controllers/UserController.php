<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Base\BaseController;

class UserController extends BaseController
{
    public function finalizeRequest(int $memberId, bool $approve, RequestJoinService $service)
    {
        $member = Member::findOrFail($memberId);

        // نتحقق من الصلاحية
        $this->authorize('finalizeJoinRequest', $member);

        $service->finalizeRequest($memberId, $approve);

        return response()->json(['message' => 'تمت مراجعة الطلب بنجاح']);
    }
}
