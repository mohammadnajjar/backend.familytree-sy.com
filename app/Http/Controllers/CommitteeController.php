<?php

namespace App\Http\Controllers;

use App\Enums\Committee\CommitteeStatus;
use App\Filters\CandidateFilter;
use App\Filters\CommitteeFilter;
use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\Committee\ApplyToCommitteeRequest;
use App\Http\Requests\Committee\CommitteeRequest;
use App\Http\Requests\Committee\VoteToCandidateRequest;
use App\Http\Resources\Committee\CommitteeLight;
use App\Http\Resources\Committee\CommitteeList;
use App\Http\Resources\Committee\CommitteeDetails;
use App\Http\Resources\Member\CandidateList;
use App\Http\Services\CommitteeMemberService;
use App\Http\Services\CommitteeService;
use App\Http\Services\CommitteeVoteService;
use App\Http\Services\MemberService;
use App\Http\Services\NotificationService;
use App\Models\Committee;
use App\Models\CommitteeMember;
use App\Models\Member;
use App\Notifications\ApplyToCommitteeNotification;
use App\Notifications\NewCommitteeNotification;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Spatie\Permission\Models\Role;

class CommitteeController extends BaseController
{
    private CommitteeService $committeeService;
    private MemberService $memberService;
    private CommitteeVoteService $committeeVoteService;
    private CommitteeMemberService $committeeMemberService;

    private NotificationService $notificationService;

    public function __construct(CommitteeService       $committeeService,
                                CommitteeVoteService   $committeeVoteService,
                                CommitteeMemberService $committeeMemberService,
                                NotificationService    $notificationService,
                                MemberService          $memberService)
    {
        $this->committeeService = $committeeService;
        $this->committeeVoteService = $committeeVoteService;
        $this->memberService = $memberService;
        $this->committeeMemberService = $committeeMemberService;
        $this->notificationService = $notificationService;

        $this->middleware('auth:sanctum')->except(['index', 'show']);
//        $this->authorizeResource(Committee::class);
    }

    public function index(CommitteeFilter $filter)
    {
        // Allow public access - no authorization needed
        $query = $this->committeeService->getAll($filter);

        $light = request('light', 0);
        if ($light == 'true' || $light == 1) {
            return CommitteeLight::query($query);
        }

        return CommitteeList::query($query);
    }

    public function store(CommitteeRequest $request): CommitteeDetails
    {
        $this->authorize('create', Committee::class);
        $committee = $this->committeeService->create($request->getData());
        $notification = new NewCommitteeNotification($committee);
        $this->notificationService->sendToAll($notification, auth()->id());
        return new CommitteeDetails($committee);
    }

    public function show(mixed $id): CommitteeDetails
    {
        $committee = $this->committeeService->findWithVotesReceived($id);
        $this->authorize('view', $committee);
        return new CommitteeDetails($committee);
    }

    public function getCandidates(mixed $id)
    {
        $this->authorize('viewAny', Committee::class);
        $committee = $this->committeeService->getCandidatesWithVotesReceived($id);
        return new CommitteeDetails($committee);
    }

    public function getAllCandidates(CandidateFilter $filter)
    {
        $this->authorize('viewAny', Member::class);
        $query = $this->committeeMemberService->getAllCommitteeCandidates($filter);
        return CandidateList::query($query);
    }

    public function getCandidate($id, ApplyToCommitteeRequest $request)
    {
        $this->authorize('viewAny', Member::class);
        $query = CommitteeMember::query()
            ->where('committee_id', $request->getData()['id'])
            ->where('member_id', $id);

        $result = $query->first();

        if (!$result) {
            return response()->json(['error' => 'Candidate not found'], 404);
        }

        Log::info("query", [$result]);

        return new CandidateList($result);
    }


    public function update(mixed $id, CommitteeRequest $request): CommitteeDetails
    {
        $committee = Committee::find($id);
        $this->authorize('update', $committee);
        $committee = $this->committeeService->update($id, $request->getData());

        return new CommitteeDetails($committee);
    }

    public function destroy(mixed $id)
    {
        $committee = Committee::findOrFail($id);

        $this->authorize('delete', $committee);

        $roleName = 'committee_' . $committee->id;
        $role = Role::where('name', $roleName)->first();
        if ($role) {
            $role->delete();
        }

        $this->committeeService->delete($id);

        return response()->noContent();
    }

    public function applyToCommittee(ApplyToCommitteeRequest $request)
    {
        $committee = $this->committeeService->find($request->getData()['id']);
        $this->authorize('view', $committee);
        if ($committee->status !== CommitteeStatus::ACTIVE) {
            abort(400, 'Committee inActive');
        }
        $member = Auth::user()->member;
        if (!$member) {
            abort(400, 'Unauthorized');
        }
        if ($committee->members()->where('member_id', $member->id)->exists()) {
            abort(400, 'You have already applied to this committee.');
        }
        $committee->members()->attach($member->id);

        $committeeMember = CommitteeMember::where([
            'committee_id' => $committee->id,
            'member_id' => $member->id
        ])->first();

        $notification = new ApplyToCommitteeNotification($committeeMember, $member);
        $this->notificationService->sendToAll($notification, Auth::id());
        return response()->noContent();

    }

    public function vote(VoteToCandidateRequest $request)
    {
        $this->committeeVoteService->vote($request->getData());

        return response()->noContent();
    }


    public function acceptCandidate(VoteToCandidateRequest $request)
    {
        $committee = $this->committeeService->find($request->getData()['committee_id']);
        $this->authorize('update', $committee);
        $data = $request->getData();
        $committeeMember = CommitteeMember::where('committee_id', $data['committee_id'])
            ->where('member_id', $data['member_id'])
            ->first();

        if (!$committeeMember) {
            abort(400, 'Member is not part of this committee.');
        }

        $committeeMember->update(['status' => $data['status']]);

        $member = $committeeMember->member;
        if ($member && $member->user_id) {
            $user = $member->user;
            if ($user) {
                $roleName = 'committee_' . $committeeMember->committee_id;
                $role = Role::firstOrCreate(['name' => $roleName]);
                $user->assignRole($role);
            }
        }

        // Optional: send notification

        return response()->noContent();
    }

    public function getMyApplications()
    {
        $this->authorize('viewAny', Committee::class);
        $member = Auth::user()->member;

        if (!$member) {
            abort(400, 'You are not a member.');
        }

        $committees = $member->committees()->get();

        return CommitteeLight::collection($committees);
    }
}
