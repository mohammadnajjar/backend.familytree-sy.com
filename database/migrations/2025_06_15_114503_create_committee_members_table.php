<?php

use App\Enums\Committee\MemberStatus;
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
        Schema::create('committee_members', function (Blueprint $table) {
            $table->id();

            $table->foreignId('committee_id')->constrained('committees');
            $table->foreignId('member_id')->constrained('members' , 'user_id');

            $table->unsignedInteger('votes_count')->default(0);

            $table->enum('status', MemberStatus::values())->default(MemberStatus::WAITING->value);

            $table->date('start_at')->nullable();
            $table->date('end_at')->nullable();

            $table->unique(['committee_id', 'member_id']);

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
        Schema::dropIfExists('committee_members');
    }
};
