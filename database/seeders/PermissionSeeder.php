<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use App\Enums\Permission\PermissionName;
use Spatie\Permission\PermissionRegistrar;

class PermissionSeeder extends Seeder
{
    public function run(): void
    {
        // Reset cached roles and permissions
        app()[PermissionRegistrar::class]->forgetCachedPermissions();

        $guardName = 'sanctum';
        $allPermissions = [];

        // Create all permissions
        foreach (PermissionName::cases() as $case) {
            $permission = Permission::firstOrCreate(
                ['name' => $case->value, 'guard_name' => $guardName]
            );
            $allPermissions[] = $permission->name;
        }

        // Get admin role with sanctum guard
        $adminRole = Role::where('name', 'admin')->where('guard_name', $guardName)->first();
        if ($adminRole) {
            $adminRole->syncPermissions($allPermissions);
            $this->command->info('Admin role: ' . count($allPermissions) . ' permissions assigned.');
        } else {
            $this->command->error('Admin role not found! Run RoleSeeder first.');
        }

        // Get member role with sanctum guard
        $memberRole = Role::where('name', 'member')->where('guard_name', $guardName)->first();
        if ($memberRole) {
            $memberRole->syncPermissions($allPermissions);
            $this->command->info('Member role: ' . count($allPermissions) . ' permissions assigned.');
        } else {
            $this->command->error('Member role not found! Run RoleSeeder first.');
        }

        // Clear cache again
        app()[PermissionRegistrar::class]->forgetCachedPermissions();
    }
}
