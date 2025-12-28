<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            RoleSeeder::class,
            PermissionSeeder::class,  // Must be after RoleSeeder
            CitySeeder::class,
            AdminSeeder::class,
            MemberSeeder::class,
//            NodeSeeder::class,
            GeneralSettingSeeder::class,
            AchievementSeeder::class,
            HistoricalEventSeeder::class,
            PhotographSeeder::class,
            DonationSeeder::class,
            MemberNodeSeeder::class,
            CommitteeSeeder::class,
        ]);
    }
}
