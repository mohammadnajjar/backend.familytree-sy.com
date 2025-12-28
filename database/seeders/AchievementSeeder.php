<?php

namespace Database\Seeders;

use App\Enums\Achievement\AchievementStatus;
use App\Enums\Medium\MediumFor;
use App\Enums\Medium\MediumType;
use App\Models\Achievement;
use App\Models\Medium;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AchievementSeeder extends Seeder
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
                'path' => 'media/Image.png',
                'extension'=>'png',
                'for' => MediumFor::UserProfile->value,
                'type' => MediumType::Image->value,
            ]);
        }
        $count = 5;

        for ($i = 1; $i <= $count; $i++) {
            Achievement::create([
                'title' => "عنوان الإنجاز رقم $i",
                'content' => "هذا محتوى الإنجاز رقم $i",
                'date' => now()->subDays($i),
                'status' => AchievementStatus::APPROVED->value,
                'description' => "وصف الإنجاز رقم $i",
                'image_id' => $image->id,
                'created_by' => 1,
            ]);
        }

    }
}
