<?php

namespace Database\Factories;

use App\Enums\Member\BloodType;
use App\Enums\Member\Gender;
use App\Enums\Member\MaritalStatus;
use App\Enums\Member\MemberStatus;
use App\Models\Member;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Member>
 */
class MemberFactory extends Factory
{
    protected $model = Member::class;

    public function definition()
    {
        return [
            'user_id' => User::factory(),
            'father_name' => $this->faker->firstNameMale(),
            'mother_name' => $this->faker->firstNameFemale(),
            'gender' => Gender::MALE->value, // أو عشوائي
            'birth_date' => $this->faker->date(),
            'health_status' => $this->faker->sentence(3),
            'work' => $this->faker->jobTitle(),
            'number_of_family_members' => $this->faker->numberBetween(1, 10),
            'persons_know' => [$this->faker->name(), $this->faker->name()],
            'status' => MemberStatus::APPROVED->value,
            'blood_type' => BloodType::O_POSITIVE->value,
            'marital_status' => MaritalStatus::Married->value,
            'city_id' => 1, // ضع رقم مدينة موجود في جدول المدن
        ];
    }
}
