<?php

namespace Database\Factories;

use App\Enums\Node\NodeType;
use App\Models\Node;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Node>
 */
class NodeFactory extends Factory
{
    protected $model = Node::class;

    public function definition()
    {
        return [
            'member_id' => null,
            'parent_id' => null,
            'type' => NodeType::CHILD,
            'full_name' => $this->faker->name(),
            'birth_date' => $this->faker->date(),
        ];
    }
}
