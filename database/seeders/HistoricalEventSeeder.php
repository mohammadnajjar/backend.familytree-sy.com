<?php

namespace Database\Seeders;

use App\Enums\HistoricalEvent\HistoricalEventStatus;
use App\Models\HistoricalEvent;
use App\Models\Medium;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class HistoricalEventSeeder extends Seeder
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
            HistoricalEvent::create([
                'title' => "عنوان الإنجاز رقم $i",
                'content' => "هذا محتوى الإنجاز رقم $i",
                'date' => now()->subDays($i),
                'status' => HistoricalEventStatus::APPROVED->value,
                'description' => "وصف الإنجاز رقم $i",
                'image_id' => $image->id,
                'created_by' => 1,
            ]);
        }
    }
}
