<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = \App\Models\User::firstOrCreate(
            ['mobile' => '999999999'],
            [
                'full_name' => 'Ahmed Ali',
                'email' => 'ahmed@example.com',
                'password' => '123456',
                'status' => \App\Enums\User\UserStatus::ACTIVE->value,
            ]
        );

        // Get admin role with sanctum guard
        $adminRole = \Spatie\Permission\Models\Role::where('name', 'admin')
            ->where('guard_name', 'sanctum')
            ->first();

        if ($adminRole) {
            $user->syncRoles([$adminRole]);
            $this->command->info('Admin user created and role assigned.');
        } else {
            $this->command->error('Admin role not found!');
        }
    }
}
