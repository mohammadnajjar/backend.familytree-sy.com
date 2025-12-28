<?php

namespace Database\Seeders;

use App\Models\City;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $cities = [
            ['name' => 'دمشق'],
            ['name' => 'حلب'],
            ['name' => 'حمص'],
            ['name' => 'حماة'],
            ['name' => 'اللاذقية'],
            ['name' => 'طرطوس'],
            ['name' => 'دير الزور'],
            ['name' => 'الرقة'],
            ['name' => 'الحسكة'],
            ['name' => 'درعا'],
            ['name' => 'السويداء'],
            ['name' => 'القنيطرة'],
            ['name' => 'إدلب'],
            ['name' => 'ريف دمشق'],
        ];

        foreach ($cities as $city) {
            City::firstOrCreate($city);
        }
    }
}
