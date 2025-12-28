<?php

use App\Enums\Member\BloodType;
use App\Enums\Member\Gender;
use App\Enums\Member\MaritalStatus;
use App\Enums\Node\NodeType;
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
        Schema::create('nodes', function (Blueprint $table) {
            $table->id();

            $table->string('full_name')->nullable();
            $table->string('father_name')->nullable();
            $table->string('mother_name')->nullable();
            $table->enum('gender', Gender::values())->nullable();
            $table->date('birth_date')->nullable();
            $table->date('death_date')->nullable();
            $table->text('health_status')->nullable();
            $table->text('work')->nullable();
            $table->integer('number_of_family_members')->nullable();
            $table->json('persons_know')->nullable();

            $table->enum('blood_type', BloodType::values())->nullable();
            $table->enum('marital_status', MaritalStatus::values())->nullable();

            $table->foreignId('city_id')->nullable()->constrained('cities');

            $table->foreignId('member_id')->nullable()->constrained('members' , 'user_id');
            $table->foreignId('parent_id')->nullable()->constrained('nodes');

            $table->enum('type', NodeType::values())->default(NodeType::CHILD->value);

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
        Schema::dropIfExists('nodes');
    }
};
