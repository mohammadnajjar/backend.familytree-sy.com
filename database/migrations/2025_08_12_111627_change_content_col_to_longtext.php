<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
return new class extends Migration
{
    public function up(): void
    {
        DB::statement('ALTER TABLE historical_events MODIFY content LONGTEXT');
        DB::statement('ALTER TABLE achievements MODIFY content LONGTEXT');
        DB::statement('ALTER TABLE committee_events MODIFY content LONGTEXT');
    }

    public function down(): void
    {
        DB::statement('ALTER TABLE historical_events MODIFY content TEXT');
        DB::statement('ALTER TABLE achievements MODIFY content TEXT');
        DB::statement('ALTER TABLE committee_events MODIFY content TEXT');
    }
};
