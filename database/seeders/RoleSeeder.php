<?php

namespace Database\Seeders;

use App\Enums\Permission\RoleName;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\PermissionRegistrar;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Reset cached roles and permissions
        app()[PermissionRegistrar::class]->forgetCachedPermissions();

        $guardName = 'sanctum';

        // Delete old roles with wrong guard
        Role::where('name', RoleName::ADMIN->value)->where('guard_name', '!=', $guardName)->delete();
        Role::where('name', RoleName::MEMBER->value)->where('guard_name', '!=', $guardName)->delete();

        Role::firstOrCreate(
            ['name' => RoleName::ADMIN->value, 'guard_name' => $guardName]
        );

        Role::firstOrCreate(
            ['name' => RoleName::MEMBER->value, 'guard_name' => $guardName]
        );

        $this->command->info('Roles created successfully with sanctum guard.');
