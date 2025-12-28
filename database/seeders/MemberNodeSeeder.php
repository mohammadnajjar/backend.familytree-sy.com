<?php

namespace Database\Seeders;

use App\Enums\Node\NodeType;
use App\Models\Member;
use App\Models\Node;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MemberNodeSeeder extends Seeder
{
    /**
     * تنشئ عقدة مع أبنائها بشكل متكرر
     * @param Node|null $parent العقدة الأب
     * @param NodeType $type نوع العقدة
     * @param int $depth عمق الشجرة المتبقي
     * @param int|null $memberId معرف العضو فقط للعقدة الجذرية
     * @return Node|null
     */
    function createNodeWithChildren(?Node $parent = null, NodeType $type, int $depth = 3, ?int $memberId = null)
    {
        if ($depth === 0) {
            return null;
        }

        $childType = $type === NodeType::CHILD ? NodeType::WIFE : NodeType::CHILD;

        $nodeData = [
            'member_id' => $parent ? $parent->member_id : $memberId,
            'parent_id' => $parent?->id,
            'type' => $type->value,
            'full_name' => fake()->name(),
            'birth_date' => fake()->date(),
        ];

        // إذا كانت عقدة جذر (memberId موجود)، نجيب بيانات العضو ونعبيها
        if ($memberId !== null && $parent === null) {
            $member = Member::find($memberId);
            if ($member) {
                $nodeData['father_name'] = $member->father_name;
                $nodeData['mother_name'] = $member->mother_name;
                $nodeData['gender'] = $member->gender;
                $nodeData['birth_date'] = $member->birth_date;
                $nodeData['death_date'] = $member->death_date;
                $nodeData['health_status'] = $member->health_status;
                $nodeData['work'] = $member->work;
                $nodeData['number_of_family_members'] = $member->number_of_family_members;
                $nodeData['persons_know'] = $member->persons_know;
                $nodeData['blood_type'] = $member->blood_type;
                $nodeData['marital_status'] = $member->marital_status;
                $nodeData['city_id'] = $member->city_id;
            }
        }

        $node = Node::create($nodeData);

        for ($i = 0; $i < 2; $i++) {
            $this->createNodeWithChildren($node, $childType, $depth - 1);
        }

        return $node;
    }


    /**
     * تشغيل الـ Seeder
     */
    public function run()
    {

        $fatherMember = Member::where("user_id", 1)->first();

        $this->createNodeWithChildren(null, NodeType::CHILD, 3, $fatherMember->id);


        Member::factory()
            ->count(10)
            ->create()
            ->each(function ($member) {
                $this->createNodeWithChildren(null, NodeType::CHILD, 3, $member->user_id);
            });
    }
}
