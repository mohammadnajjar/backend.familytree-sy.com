<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('members', function (Blueprint $table) {
            $table->string('birth_place')->nullable()->after('death_date');
            $table->string('death_place')->nullable()->after('birth_place');
        });

        Schema::table('nodes', function (Blueprint $table) {
            $table->string('birth_place')->nullable()->after('death_date');
            $table->string('death_place')->nullable()->after('birth_place');
        });
    }

    public function down(): void
    {
        Schema::table('members', function (Blueprint $table) {
            $table->dropColumn(['birth_place', 'death_place']);
        });

        Schema::table('nodes', function (Blueprint $table) {
            $table->dropColumn(['birth_place', 'death_place']);
        });
    }
};
