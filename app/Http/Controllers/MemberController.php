<?php

namespace App\Http\Controllers;

use App\Filters\RequestJoinFilter;
use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Member\MemberDetails;
use App\Http\Resources\Member\MemberList;
use App\Http\Services\MemberService;
use App\Models\Achievement;
use App\Models\Member;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class MemberController extends BaseController
{
    private MemberService $memberService;

    public function __construct(MemberService $memberService)
    {
        $this->memberService = $memberService;

        $this->middleware('auth:sanctum');
    }
    public function index(RequestJoinFilter $filter)
    {
        $this->authorize('viewAny',Member::class);

        $query = $this->memberService->getAllMember($filter);

        $light = request('light', 0);
        if ($light == 'true' || $light == 1) {
            return MemberList::query($query);
        }

        return MemberList::query($query);
    }

    public function show(mixed $id)
    {
        $member = $this->memberService->find($id);
        $this->authorize('view',$member);
        $achievements = Achievement::where('created_by', $id)->get();

        Log::info("achievements_member",[$achievements]);
        if ($achievements) {
            $member['achievements'] = $achievements;
            Log::info("achievements_member", [$member]);
        }
        return new MemberDetails($member);
    }
}
