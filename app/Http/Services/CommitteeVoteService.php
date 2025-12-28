<?php

namespace App\Http\Services;

use App\Models\Committee;
use App\Models\CommitteeMember;
use App\Models\CommitteeVote;
use App\Http\Services\Base\CrudService;
use App\Models\Member;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;


class CommitteeVoteService extends CrudService
{
    protected function getModelClass(): string
        {
            return CommitteeVote::class;
        }

    public function vote(array $data): CommitteeVote
    {
        /** @var Member $voter */
        $voter = Auth::user();
        $candidateId = $data['member_id'];
        $committeeId = $data['committee_id'];

        if (!$voter) {
            abort(400, 'You are not a member of the family.');
        }

        if ($voter->id === $candidateId) {
            abort(400, 'You cannot vote for yourself.');
        }

        $existingVote = CommitteeVote::where('committee_id', $committeeId)
            ->where('voter_id', $voter->id)
            ->first();

        if ($existingVote) {
            abort(400, 'Vote in advance for this candidate');
        }
        Log::info("test",[$committeeId, $candidateId]);

        $committeeMember = CommitteeMember::query()
            ->where('committee_id', $committeeId)
            ->where('member_id', $candidateId)->first();

        Log::info("committeeMember",[$committeeMember]);

        if (!$committeeMember) {
            abort(400, 'This candidate does not belong to this committee.');
        }

        $committeeVote = CommitteeVote::create([
            'committee_id' => $committeeId,
            'voter_id' => $voter->id,
            'candidate_id' => $committeeMember->id,
        ]);

        CommitteeMember::where('committee_id', $committeeId)
            ->where('member_id', $candidateId)
            ->increment('votes_count');


        return $committeeVote;
    }

}
