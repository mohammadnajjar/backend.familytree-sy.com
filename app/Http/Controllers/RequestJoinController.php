<?php

namespace App\Http\Controllers;

use App\Enums\Member\MemberStatus;
use App\Filters\RequestJoinFilter;
use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\RequestJoin\RequestJoinRequest;
use App\Http\Requests\ReviewRequest;
use App\Http\Resources\RequestJoin\RequestJoinLight;
use App\Http\Resources\RequestJoin\RequestJoinList;
use App\Http\Resources\RequestJoin\RequestJoinDetails;
use App\Http\Services\NotificationService;
use App\Http\Services\RequestJoinService;
use App\Models\Member;
use App\Models\User;
use App\Notifications\FinalizeJoinRequestNotification;
use App\Notifications\RequestJoinNotification;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Validation\Rule;

class RequestJoinController extends BaseController
{
    private RequestJoinService $requestJoinService;
    private NotificationService $notificationService;

    public function __construct(RequestJoinService $requestJoinService, NotificationService $notificationService)
    {
        $this->requestJoinService = $requestJoinService;
        $this->notificationService = $notificationService;

        $this->middleware('auth:sanctum')->except(['store']);
    }

    public function index(RequestJoinFilter $filter)
    {
        $this->authorize('viewAnyJR', Member::class);

        $query = $this->requestJoinService->getAll($filter);

        $light = request('light', 0);
        if ($light == 'true' || $light == 1) {
            return RequestJoinLight::query($query);
        }

        return RequestJoinList::query($query);
    }

    public function store(RequestJoinRequest $request)
    {
        $requestJoin = $this->requestJoinService->create($request->getData());
        $this->notificationService->sendToAll(
            new RequestJoinNotification($requestJoin->user_id),
            $requestJoin->user_id
        );

        return new RequestJoinDetails($requestJoin);
    }

    public function show(mixed $id): RequestJoinDetails
    {
        $requestJoin = $this->requestJoinService->find($id);
        $this->authorize('viewJR', $requestJoin);

        return new RequestJoinDetails($requestJoin);
    }

    public function finalize(Request $request): Response
    {
        $validated = $request->validate([
            'memberId' => ['required', 'int', Rule::exists('members', 'user_id')],
            'status' => ['required', Rule::in(MemberStatus::values())],
        ]);
        $member = Member::where('user_id', $validated['memberId'])->firstOrFail();

        $this->authorize('updateJR', $member);

        $this->requestJoinService->finalizeRequest($validated['memberId'], $validated['status']);

        $targetUser = User::findOrFail($validated['memberId']);

        if ($targetUser->fcm_token) {
            $notification = new FinalizeJoinRequestNotification(
                $targetUser->id,
                MemberStatus::from($validated['status'])
            );

            $this->notificationService->sendToUser($targetUser->id, $notification);
        }
        return response()->noContent();
    }

    public function review(ReviewRequest $request)
    {
        $this->authorize('updateJR', Member::class);
        $this->requestJoinService->reviewRequest($request->getData());

        return response()->noContent();
    }
}



//
//namespace App\Services;
//
//use App\Models\Member;
//use App\Models\Node;
//use Illuminate\Support\Facades\DB;
//
//class NodeService
//{
//    /**
//     * Create a pending node for a future user (e.g., a child).
//     */
//    public function createPendingNode(array $data): Node
//    {
//        return DB::transaction(function () use ($data) {
//            return Node::create([
//                'parent_id' => $data['parent_id'] ?? null,
//                'type' => $data['type'] ?? 'child',
//                'full_name' => $data['full_name'],
//                'birth_date' => $data['birth_date'] ?? null,
//                'created_by' => auth()->id(),
//            ]);
//        });
//    }
//
//    /**
//     * Try to match a new member with any pending node.
//     */
//    public function matchMemberToPendingNode(Member $member): void
//    {
//        $node = Node::whereNull('member_id')
//            ->where('full_name', $member->full_name)
//            ->when($member->birth_date, function ($query) use ($member) {
//                $query->whereDate('birth_date', $member->birth_date);
//            })
//            ->first();
//
//        if ($node) {
//            $node->update([
//                'member_id' => $member->id,
//                'full_name' => null,
//                'birth_date' => null,
//                'updated_by' => auth()->id(),
//            ]);
//        }
//    }
//}

// نموذج استخدام:
// (1) إنشاء عقدة مسبقة لطفل لم يُسجل بعد:
// $nodeService->createPendingNode([
//     'parent_id' => 12,
//     'type' => 'child',
//     'full_name' => 'علي محمد',
//     'birth_date' => '2010-05-01'
// ]);

// (2) عند تسجيل عضو جديد:
// $nodeService->matchMemberToPendingNode($newMember);

