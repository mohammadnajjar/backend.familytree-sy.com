<?php

namespace Database\Seeders;

use App\Enums\Member\BloodType;
use App\Enums\Member\Gender;
use App\Enums\Member\MaritalStatus;
use App\Enums\Member\MemberStatus;
use App\Enums\Permission\RoleName;
use App\Enums\User\UserStatus;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class MemberSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $members = [
            ['full_name' => 'أحمد محمد', 'father_name' => 'محمد', 'mother_name' => 'سعاد', 'gender' => Gender::MALE],
            ['full_name' => 'فاطمة علي', 'father_name' => 'علي', 'mother_name' => 'نور', 'gender' => Gender::FEMALE],
            ['full_name' => 'خالد حسن', 'father_name' => 'حسن', 'mother_name' => 'هدى', 'gender' => Gender::MALE],
            ['full_name' => 'مريم أحمد', 'father_name' => 'أحمد', 'mother_name' => 'فاطمة', 'gender' => Gender::FEMALE],
            ['full_name' => 'عمر سعيد', 'father_name' => 'سعيد', 'mother_name' => 'ليلى', 'gender' => Gender::MALE],
            ['full_name' => 'زينب محمود', 'father_name' => 'محمود', 'mother_name' => 'آمنة', 'gender' => Gender::FEMALE],
            ['full_name' => 'يوسف إبراهيم', 'father_name' => 'إبراهيم', 'mother_name' => 'خديجة', 'gender' => Gender::MALE],
            ['full_name' => 'سارة عبدالله', 'father_name' => 'عبدالله', 'mother_name' => 'رقية', 'gender' => Gender::FEMALE],
            ['full_name' => 'محمد خالد', 'father_name' => 'خالد', 'mother_name' => 'مريم', 'gender' => Gender::MALE],
            ['full_name' => 'نور حسين', 'father_name' => 'حسين', 'mother_name' => 'زهرة', 'gender' => Gender::FEMALE],
        ];

        foreach ($members as $index => $memberData) {
            $user = User::create([
                'full_name' => $memberData['full_name'],
                'mobile' => '9' . str_pad($index + 1, 8, '0', STR_PAD_LEFT),
                'email' => 'user' . ($index + 1) . '@familytree.com',
                'password' => 'password123', // Model will hash it automatically
                'status' => UserStatus::ACTIVE->value,
            ]);

            $user->assignRole(RoleName::MEMBER->value);

            $user->member()->create([
                'father_name' => $memberData['father_name'],
                'mother_name' => $memberData['mother_name'],
                'gender' => $memberData['gender']->value,
                'birth_date' => '199' . $index . '-01-15',
                'health_status' => 'جيدة',
                'work' => 'موظف',
                'number_of_family_members' => rand(2, 8),
                'persons_know' => ['شخص معروف 1', 'شخص معروف 2'],
                'status' => MemberStatus::APPROVED->value,
                'blood_type' => BloodType::O_POSITIVE->value,
                'marital_status' => MaritalStatus::Married->value,
                'city_id' => rand(1, 14),
            ]);
        }

        $this->command->info('Created 10 users with members successfully.');
    }
}
