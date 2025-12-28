<?php

namespace App\Http\Controllers;


use App\Enums\Member\MemberStatus;
use App\Http\Controllers\Base\BaseController;
use App\Models\Achievement;
use App\Models\Committee;
use App\Models\Donation;
use App\Models\HistoricalEvent;
use App\Models\Member;
use App\Models\Photograph;
use Illuminate\Support\Facades\Auth;

class MemberStatisticController extends BaseController
{
    public function getMemberStatistics()
    {
        $this->authorize('viewMemberStats',Member::class);

        $user = Auth::user();
        $member = $user->member;

        // إنجازات
        $achievements = [
            'approved' => Achievement::where('created_by', $user->id)->where('status', MemberStatus::APPROVED)->count(),
            'pending' => Achievement::where('created_by', $user->id)->where('status', MemberStatus::WAITING)->count(),
            'rejected' => Achievement::where('created_by', $user->id)->where('status', MemberStatus::REJECTED)->count(),
        ];

        $historicalEvents = [
            'approved' => HistoricalEvent::where('created_by', $user->id)->where('status', MemberStatus::APPROVED)->count(),
            'pending' => HistoricalEvent::where('created_by', $user->id)->where('status', MemberStatus::WAITING)->count(),
            'rejected' => HistoricalEvent::where('created_by', $user->id)->where('status', MemberStatus::REJECTED)->count(),
        ];

        $photographs = [
            'approved' => Photograph::where('created_by', $user->id)->where('status', MemberStatus::APPROVED)->count(),
            'pending' => Photograph::where('created_by', $user->id)->where('status', MemberStatus::WAITING)->count(),
            'rejected' => Photograph::where('created_by', $user->id)->where('status', MemberStatus::REJECTED)->count(),
        ];

        $donations = [
            'approved' => Donation::where('created_by', $user->id)->where('status', MemberStatus::APPROVED)->count(),
            'pending' => Donation::where('created_by', $user->id)->where('status', MemberStatus::WAITING)->count(),
            'rejected' => Donation::where('created_by', $user->id)->where('status', MemberStatus::REJECTED)->count(),
        ];

        $membersAdded = [
            'approved' => Member::where('created_by', $user->id)
                ->whereHas('node')
                ->where('user_id', '!=', $user->id)
                ->where('status', MemberStatus::APPROVED)->count(),

            'pending' => Member::where('created_by', $user->id)
                ->where('user_id', '!=', $user->id)
                ->where('status', MemberStatus::WAITING)->count(),

            'rejected' => Member::where('created_by', $user->id)
                ->where('user_id', '!=', $user->id)
                ->where('status', MemberStatus::REJECTED)->count(),
        ];

        $allMembersCount = [
            'approved' => Member::where('status', MemberStatus::APPROVED)->whereHas('node')->count(),
            'pending' => Member::where('status', MemberStatus::WAITING)->count(),
            'rejected' => Member::where('status', MemberStatus::REJECTED)->count(),
            'total' => Member::count(),
        ];

        $familyMembersCount = $member->number_of_family_members ?? 0;

        $myCommitteesCount = $member?->committees()->count() ?? 0;

        $committeesTotalCount = Committee::count();

        return response()->json([
            'achievements' => $achievements,
            'historical_events' => $historicalEvents,
            'photographs' => $photographs,
            'donations' => $donations,
            'members_added' => $membersAdded,
            'family_members_count' => $familyMembersCount,
            'my_committees_count' => $myCommitteesCount,
            'total_committees_count' => $committeesTotalCount,
            'all_members_count' => $allMembersCount
        ]);
    }

    public function getAdminStatistics()
    {
        $this->authorize('viewAdminStats',Member::class);

        $user = Auth::user();
        $member = $user->member;

        $achievements = [
            'approved' => Achievement::where('status', MemberStatus::APPROVED)->count(),
            'pending' => Achievement::where('status', MemberStatus::WAITING)->count(),
            'rejected' => Achievement::where('status', MemberStatus::REJECTED)->count(),
        ];

        $historicalEvents = [
            'approved' => HistoricalEvent::where('status', MemberStatus::APPROVED)->count(),
            'pending' => HistoricalEvent::where('status', MemberStatus::WAITING)->count(),
            'rejected' => HistoricalEvent::where('status', MemberStatus::REJECTED)->count(),
        ];

        $photographs = [
            'approved' => Photograph::where('status', MemberStatus::APPROVED)->count(),
            'pending' => Photograph::where('status', MemberStatus::WAITING)->count(),
            'rejected' => Photograph::where('status', MemberStatus::REJECTED)->count(),
        ];

        $donations = [
            'approved' => Donation::where('status', MemberStatus::APPROVED)->count(),
            'pending' => Donation::where('status', MemberStatus::WAITING)->count(),
            'rejected' => Donation::where('status', MemberStatus::REJECTED)->count(),
        ];

        $allRequestsJoin = [
            'pending' => Member::where('status', MemberStatus::WAITING)->count(),
            'rejected' => Member::where('status', MemberStatus::REJECTED)->count(),
        ];
        $myCommitteesCount = $member?->committees()->count() ?? 0;

        $committeesTotalCount = Committee::count();

        return response()->json([
            'achievements' => $achievements,
            'historical_events' => $historicalEvents,
            'photographs' => $photographs,
            'donations' => $donations,
            'all_requests_join' => $allRequestsJoin,
            'my_committees_count' => $myCommitteesCount,
            'total_committees_count' => $committeesTotalCount,
            'all_members' => Member::where('status', MemberStatus::APPROVED)->whereHas('node')->count()
        ]);
    }
}
