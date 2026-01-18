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
        // Member model uses user_id as primary key, but we receive member.id from frontend
        // So we need to find by id column explicitly
        $member = Member::where('id', $id)->with(['user', 'city'])->firstOrFail();
        $this->authorize('view', $member);

        // Get achievements using user_id
        $achievements = Achievement::where('created_by', $member->user_id)->get();

        if ($achievements->isNotEmpty()) {
            $member->achievements = $achievements;
        }

        return new MemberDetails($member);
    }
}
