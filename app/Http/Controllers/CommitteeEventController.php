<?php
namespace App\Http\Controllers;

use App\Filters\CommitteeEventFilter;
use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\CommitteeEvent\CommitteeEventRequest;
use App\Http\Resources\CommitteeEvent\CommitteeEventDetails;
use App\Http\Resources\CommitteeEvent\CommitteeEventList;
use App\Http\Resources\CommitteeEvent\CommitteeEventLight;
use App\Http\Services\CommitteeEventService;
use App\Http\Services\NotificationService;
use App\Models\CommitteeEvent;
use App\Models\CommitteeMember;
use App\Notifications\NewCommitteeEventNotification;
use Illuminate\Auth\Access\AuthorizationException;

class CommitteeEventController extends BaseController
{
    private CommitteeEventService $committeeEventService;
    private NotificationService $notificationService;

    public function __construct(CommitteeEventService $committeeEventService, NotificationService $notificationService)
    {
        $this->committeeEventService = $committeeEventService;
        $this->notificationService = $notificationService;

        $this->middleware('auth:sanctum');
    }

    public function index(CommitteeEventFilter $filter)
    {
        $this->authorize('viewAny', CommitteeEvent::class);
        $query = $this->committeeEventService->getAll($filter);

        $light = request('light', 0);
        if ($light == 'true' || $light == 1) {
            return CommitteeEventLight::query($query);
        }

        return CommitteeEventList::query($query);
    }


    public function store(CommitteeEventRequest $request): CommitteeEventDetails
    {
        $this->authorize('create', CommitteeEvent::class);

        $user = auth()->user();
        $data = $request->getData();

        $committeeId = $data['committee_id'];

        $isAdmin = $user->hasRole('admin');

        $isCommitteeMember = CommitteeMember::where('committee_id', $committeeId)
            ->where('member_id', optional($user->member)->id)
            ->exists();

        if (! $isAdmin && ! $isCommitteeMember) {
            throw new AuthorizationException('غير مصرح لك بإنشاء حدث لهذه اللجنة.');
        }

        $event = $this->committeeEventService->create($data);
        $notification = new NewCommitteeEventNotification($event);
        $this->notificationService->sendToAll($notification, auth()->id());
        return new CommitteeEventDetails($event);
    }

    public function show($id): CommitteeEventDetails
    {
        $event = $this->committeeEventService->find($id);
        $this->authorize('view', $event);

        return new CommitteeEventDetails($event);
    }

    public function update($id, CommitteeEventRequest $request): CommitteeEventDetails
    {
        $event = $this->committeeEventService->find($id);
        $this->authorize('update', $event);
        $event = $this->committeeEventService->update($id, $request->getData());
        return new CommitteeEventDetails($event);
    }

    public function destroy($id)
    {
        $event = $this->committeeEventService->find($id);
        $this->authorize('delete', $event);
        $this->committeeEventService->delete($id);
        return response()->noContent();
    }

    public function getByCommittee($committeeId, CommitteeEventFilter $filter)
    {
        $this->authorize('viewAny', CommitteeEvent::class);

        $query = $this->committeeEventService->getAllByCommitteeWithFilter($committeeId,$filter);

        $light = request('light', 0);
        if ($light == 'true' || $light == 1) {
            return CommitteeEventLight::query($query);
        }
        return CommitteeEventList::query($query);
    }
}
