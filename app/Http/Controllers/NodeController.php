<?php

namespace App\Http\Controllers;

use App\Filters\NodeFilter;
use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\Node\CreatePendingNodeRequest;
use App\Http\Requests\Node\LinkToParentRequest;
use App\Http\Requests\Node\MatchPendingNodesRequest;
use App\Http\Requests\Node\NodeRequest;
use App\Http\Resources\Node\NodeDetails;
use App\Http\Resources\Node\NodeList;
use App\Http\Resources\Node\NodeListWithChildren;
use App\Http\Services\NodeService;
use App\Models\Node;
use Illuminate\Support\Facades\Auth;

class NodeController extends BaseController
{
    private NodeService $nodeService;

    public function __construct(NodeService $nodeService)
    {
        $this->nodeService = $nodeService;

        $this->middleware('auth:sanctum')->except(['index', 'show', 'getNodesWithChildren', 'getChildrenOfNode']);
    }

    public function index(NodeFilter $filter)
    {
        // Allow public access - no authorization needed
        $query = $this->nodeService->getAll($filter);

        $light = request('light', 0);
        if ($light == 'true' || $light == 1) {
            return NodeList::query($query);
        }

        return NodeList::query($query);
    }

    public function getNodesWithChildren()
    {
        // Allow public access - no authorization needed for viewing tree
        $rootNodes = Node::whereNull('parent_id')->with('children')->get();

        return NodeListWithChildren::collection($rootNodes);
    }

    public function store(NodeRequest $request): NodeDetails
    {
        $this->authorize('create', Node::class);

        $data = $request->getData();
        $data['member_id'] = Auth::user()->id;

        $member = Auth::user()?->member;
        $data['full_name'] = Auth::user()?->full_name ?? $data['full_name'];
        $data['father_name'] = $member?->father_name;
        $data['mother_name'] = $member?->mother_name;
        $data['gender'] = $member?->gender;
        $data['birth_date'] = $member?->birth_date;
        $data['birth_place'] = $member?->birth_place;
        $data['health_status'] = $member?->health_status;
        $data['work'] = $member?->work;
        $data['number_of_family_members'] = $member?->number_of_family_members;
        $data['persons_know'] = $member?->persons_know;
        $data['blood_type'] = $member?->blood_type;
        $data['marital_status'] = $member?->marital_status;
        $data['city_id'] = $member?->city_id;
        $data['family_name'] = $member?->family_name;

        try {
            $node = $this->nodeService->create($data);

            if ($member && $member->certificates()->exists()) {
                $node->certificates()->sync($member->certificates->pluck('id')->toArray());
            }

        } catch (\Exception $e) {
            abort(400, $e->getMessage());
        }

        return new NodeDetails($node);
    }

    public function show(mixed $id): NodeDetails
    {
        $node = $this->nodeService->find($id);
        $this->authorize('view',$node);

        return new NodeDetails($node);
    }

    public function update(mixed $id, NodeRequest $request): NodeDetails
    {
        $node = $this->nodeService->find($id);
        $this->authorize('update', $node);

        $data = $request->getData();
        $data['member_id'] = Auth::user()->id;

        $node = $this->nodeService->update($id, $data);

        if ($request->has('certificates')) {
            $node->certificates()->sync($request->input('certificates', []));
        }

        return new NodeDetails($node);
    }

    public function destroy(mixed $id)
    {
        $node = $this->nodeService->find($id);
        $this->authorize('delete', $node);
        $this->nodeService->delete($id);
        return response()->noContent();
    }

    public function match(MatchPendingNodesRequest $request)
    {
        $this->authorize('viewAny', Node::class);
        $nodes = $this->nodeService->matchMemberToPendingNodes($request->getData());
        return NodeDetails::collection($nodes);
    }

    public function createPending(CreatePendingNodeRequest $request)
    {
        $this->authorize('create', Node::class);
        $node = $this->nodeService->createPendingNode($request->getData());
        return new NodeDetails($node);
    }

    public function linkToNode(LinkToParentRequest $request)
    {
        $node = $this->nodeService->linkToParent($request->getData());
        return new NodeDetails($node);
    }

    public function getChildrenOfNode($id)
    {
        // Allow public access - no authorization needed for viewing tree
        $children = $this->nodeService->getChildren($id);
        return NodeList::collection($children);
    }
}
