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
        Schema::create('committee_votes', function (Blueprint $table) {
            $table->id();

            $table->foreignId('committee_id')->constrained()->onDelete('cascade');
            $table->foreignId('voter_id')->constrained('members' , 'user_id')->onDelete('cascade');
            $table->foreignId('candidate_id')->constrained('members' , 'user_id')->onDelete('cascade');

            $table->foreignId('created_by')->nullable()->constrained('users');
            $table->foreignId('updated_by')->nullable()->constrained('users');
            $table->timestamps();

            $table->foreignId('deleted_by')->nullable()->constrained('users');
            $table->softDeletes();


            $table->unique(['committee_id', 'voter_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('committee_votes');
    }
};
