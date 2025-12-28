<?php

namespace App\Http\Services;

use App\Models\Node;
use App\Http\Services\Base\CrudService;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;

class NodeService extends CrudService
{
    protected function getModelClass(): string
    {
        return Node::class;
    }

    public function create(array $data): \App\Models\Base\BaseModel
    {
        $exists = Node::where('member_id', $data['member_id'])->exists();

        if ($exists) {
            throw new \Exception('عذراً، هذا العضو لديه عقدة مرتبطة مسبقاً.');
        }

        return Node::create($data);
    }

    /**
     * Create a pending node for a future user (e.g., a child).
     */
    public function createPendingNode(array $data)
    {
        $node = Node::create($data);

        if (!empty($data['certificates'])) {
            $node->certificates()->sync($data['certificates']);
        }

        return $node;
    }


    private function getDescendantNodeIds(int $ancestorNodeId): array
    {
        $descendants = collect();
        $stack = [$ancestorNodeId];

        while (!empty($stack)) {
            $currentId = array_pop($stack);
            $children = Node::where('parent_id', $currentId)->pluck('id')->all();

            $descendants->push(...$children);
            $stack = array_merge($stack, $children);
        }

        return $descendants->toArray();
    }

    /**
     * Try to match a new member with any pending node.
     */
    public function matchMemberToPendingNodes(array $data): Collection
    {
        $member = Auth::user()->member;

        if (!$member) {
            abort(400, 'Unauthorized');
        }
        $nodesQuery = $this->getQuery()
            ->whereNull('member_id');

        if (isset($data['parent_id'])) {
            $nodesQuery->where('parent_id', $data['parent_id']);
        }

        if (isset($data['ancestor_id'])) {
            $descendantNodeIds = $this->getDescendantNodeIds($data['ancestor_id']);
            $nodesQuery->whereIn('id', $descendantNodeIds);
        }

        if (isset($data['full_name'])) {
            $nodesQuery->where('full_name', 'like', '%' . $data['full_name'] . '%');
        }

        if (isset($data['birth_date'])) {
            $nodesQuery->where('birth_date', $data['birth_date']);
        }

        return $nodesQuery->get();
    }

    public function linkToParent(array $data): Node
    {
        $node = Node::where('id' , $data['node_id'])->first();
        if (!is_null($node->member_id)) {
            abort(422, 'هذه العقدة مرتبطة بعضو ولا يمكن ربطها بعضو آخر.');
        }
        $user = Auth::user();
        if ($user?->node) {
            abort(422, 'هذا العضو مرتبط بعقدة ولا يمكن ربطه بعقدة أخرى.');
        }
        $updateData = ['member_id' => Auth::id()];

        if (isset($data['parent_id'])) {
            $updateData['parent_id'] = $data['parent_id'];
        }

        $node->update($updateData);
        $node->save();

        return $node;
    }

    public function getChildren(int $nodeId): Collection
    {
        return Node::where('parent_id', $nodeId)->get();
    }

}
