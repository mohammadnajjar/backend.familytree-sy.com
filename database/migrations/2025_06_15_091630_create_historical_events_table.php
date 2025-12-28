<?php

use App\Enums\HistoricalEvent\HistoricalEventStatus;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('historical_events', function (Blueprint $table) {
            $table->id();

            $table->string('title')->nullable();
            $table->text('content')->nullable();
            $table->string('description')->nullable();
            $table->dateTime('date')->nullable();

            $table->enum('status', HistoricalEventStatus::values())->default(HistoricalEventStatus::WAITING->value);

            $table->foreignId('image_id')->nullable()->constrained('media');

            $table->foreignId('created_by')->nullable()->constrained('users');
            $table->foreignId('updated_by')->nullable()->constrained('users');
            $table->timestamps();

            $table->foreignId('deleted_by')->nullable()->constrained('users');
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('historical_events');
    }
};
