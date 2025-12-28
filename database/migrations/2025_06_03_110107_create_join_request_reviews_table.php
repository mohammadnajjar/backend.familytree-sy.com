<?php

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
        Schema::create('join_request_reviews', function (Blueprint $table) {
            $table->id();

            $table->foreignId('join_request_id')->constrained('members')->onDelete('cascade');
            $table->foreignId('reviewer_id')->constrained('users')->onDelete('cascade');
            $table->boolean('is_approved');
            $table->text('note')->nullable();
            $table->timestamps();

            $table->unique(['join_request_id', 'reviewer_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('join_request_reviews');
    }
};
