<?php

namespace App\Http\Controllers;

use App\Filters\RequestJoinFilter;
use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Member\MemberDetails;
use App\Http\Resources\Member\MemberList;
use App\Http\Services\MemberService;
use App\Models\Achievement;
use App\Models\Member;
use App\Enums\Member\MemberStatus;
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

    public function update(mixed $id, Request $request)
    {
        $member = Member::where('id', $id)->firstOrFail();
        $this->authorize('update', $member);

        // Handle status: 1=APPROVED, 2=REJECTED
        $statusValue = $request->input('status');
        if ($statusValue !== null) {
            // Convert 0 to REJECTED (2), 1 to APPROVED (1)
            $status = $statusValue == 1 ? MemberStatus::APPROVED : MemberStatus::REJECTED;
            $member->update(['status' => $status]);
        }

        // Reload member with all relations
        $member = Member::where('id', $id)->with(['user', 'city'])->firstOrFail();

        // Get achievements using user_id
        $achievements = Achievement::where('created_by', $member->user_id)->get();
        if ($achievements->isNotEmpty()) {
            $member->achievements = $achievements;
        }

        return new MemberDetails($member);
    }

    public function destroy(mixed $id)
    {
        $member = Member::where('id', $id)->firstOrFail();
        $this->authorize('delete', $member);

        $member->delete();

        return response()->noContent();
    }
}
