<?php

namespace Database\Seeders;

use App\Enums\Donation\DonationStatus;
use App\Enums\HistoricalEvent\HistoricalEventStatus;
use App\Models\Donation;
use App\Models\HistoricalEvent;
use App\Models\Medium;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DonationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $count = 10;

        for ($i = 1; $i <= $count; $i++) {
            Donation::create([
                'title' => "عنوان التبرع $i",
                'message' => "رسالة التبرع رقم $i",
                'description' => "وصف مختصر للتبرع رقم $i",
                'status' => DonationStatus::APPROVED->value,
                'amount' => rand(50, 500), // قيمة عشوائية بين 50 و 500
                'created_by' => 1,
                'updated_by' => 1, // اختياري
            ]);
        }
    }
}
