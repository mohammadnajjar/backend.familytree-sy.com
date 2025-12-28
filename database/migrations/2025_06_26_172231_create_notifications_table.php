<?php

use App\Enums\Notification\NotificationType;
use App\Enums\User\UserSlide;
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
        Schema::create('notifications', function (Blueprint $table) {
            $table->id();

            $table->string('title');
            $table->text('body');
            $table->enum('type', NotificationType::values())->nullable();
            $table->enum('slide', UserSlide::values())->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->boolean('is_seen')->default(false);
            $table->foreign('user_id')->references('id')->on('users')->cascadeOnDelete();
            $table->datetime('date')->nullable();

            $table->string('topic_target')->nullable();

            $table->string('entity_type')->nullable();
            $table->unsignedBigInteger('entity_id')->nullable();

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
        Schema::dropIfExists('notifications');
    }
};
