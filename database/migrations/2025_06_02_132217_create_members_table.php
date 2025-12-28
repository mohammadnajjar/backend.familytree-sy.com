<?php

use App\Enums\Member\BloodType;
use App\Enums\Member\Gender;
use App\Enums\Member\MaritalStatus;
use App\Enums\Member\MemberStatus;
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
        Schema::create('members', function (Blueprint $table) {
            $table->id();
            $table->string('father_name')->nullable();
            $table->string('mother_name')->nullable();
            $table->enum('gender', Gender::values())->nullable();
            $table->date('birth_date')->nullable();
            $table->date('death_date')->nullable();
            $table->text('health_status')->nullable();
            $table->text('work')->nullable();
            $table->integer('number_of_family_members')->nullable();
            $table->json('persons_know')->nullable();

            $table->enum('status', MemberStatus::values())->default(MemberStatus::WAITING->value);
            $table->enum('blood_type', BloodType::values())->nullable();
            $table->enum('marital_status', MaritalStatus::values())->nullable();

            $table->foreignId('user_id')->nullable()->constrained('users');
            $table->foreignId('city_id')->nullable()->constrained('cities');

            $table->foreignId('created_by')->nullable()->constrained('users');
            $table->foreignId('updated_by')->nullable()->constrained('users');
            $table->foreignId('deleted_by')->nullable()->constrained('users');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('members');
    }
};
