<?php

namespace Database\Factories;

use App\Enums\Permission\RoleName;
use App\Enums\User\UserStatus;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    protected $model = User::class;

    public function definition(): array
    {
        return [
            'full_name' => $this->faker->name(),
            'mobile' => $this->faker->unique()->numerify('9########'),
            'email' => $this->faker->unique()->safeEmail(),
            'password' => bcrypt('password'), // ثابت أو مولد
            'status' => UserStatus::ACTIVE->value,
            'fcm_token' => null,
        ];
    }

    protected static function newFactory()
    {
        return static::new();
    }

    public function configure()
    {
        return $this->afterCreating(function (User $user) {
            $user->assignRole(RoleName::MEMBER->value);
        });
    }
}
