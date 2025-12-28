<?php

namespace Database\Seeders;

use App\Enums\Committee\CommitteeStatus;
use App\Models\Committee;
use App\Models\Member;
use Carbon\Carbon;
use Illuminate\Database\Seeder;

class CommitteeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $now = Carbon::now();

        $committees = [
            [
                'name' => 'لجنة الطوارئ',
                'description' => 'متابعة الحالات الطارئة والخدمات العاجلة.',
                'start_at' => $now->copy()->subMonths(2),
                'end_at' => $now->copy()->addMonths(1),
                'status' => CommitteeStatus::ACTIVE,
            ],
            [
                'name' => 'اللجنة الاجتماعية',
                'description' => 'تنظيم الفعاليات والأنشطة الاجتماعية.',
                'start_at' => $now->copy()->subMonths(6),
                'end_at' => $now->copy()->subMonth(),
                'status' => CommitteeStatus::ACTIVE,
            ],
            [
                'name' => 'لجنة التخطيط',
                'description' => 'إعداد خطط العمل السنوية وتقييم الأداء.',
                'start_at' => $now,
                'end_at' => $now->copy()->addMonths(3),
                'status' => CommitteeStatus::ACTIVE,
            ],
        ];

        $members = Member::inRandomOrder()->take(3)->get();


        foreach ($committees as $index => $data) {
            $committee = Committee::create($data);

            $member = $members[$index % $members->count()];
            $committee->members()->attach($member->id);
        }
    }
}
