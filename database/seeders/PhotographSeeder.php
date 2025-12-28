<?php

namespace Database\Seeders;

use App\Enums\Photograph\PhotographStatus;
use App\Models\Medium;
use App\Models\Photograph;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PhotographSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $image = Medium::where('path', 'media/Image.png')->first();

        if (!$image) {
            $image = Medium::create([
                'path' => 'media/Image.png'
            ]);
        }
        $count = 5;

        for ($i = 1; $i <= $count; $i++) {
            $photograph = Photograph::create([
                'title' => "صورة فوتوغرافية $i",
                'description' => "وصف للصورة رقم $i",
                'date' => now()->subDays($i),
                'status' => PhotographStatus::APPROVED,
                'created_by' => 1,
                'updated_by' => 1,
            ]);

            // ربط الصورة نفسها بكل Photograph
            $photograph->images()->attach($image->id);
        }
    }
}
