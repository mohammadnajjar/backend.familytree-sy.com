<?php

namespace Database\Seeders;

use App\Enums\Node\NodeType;
use App\Models\Node;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class NodeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $node = Node::create([
            'type' => NodeType::CHILD->value,
            'parent_id'=>null,
            'member_id'=>1,
        ]);
    }
}
