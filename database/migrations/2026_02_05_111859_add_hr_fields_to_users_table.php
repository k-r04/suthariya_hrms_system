<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->foreignId('departments_id')->nullable()->constrained();
            $table->foreignId('positions_id')->nullable()->constrained();
            $table->string('employee_id')->unique()->nullable();
            $table->string('phone')->nullable();
            $table->date('date_of_birth')->nullable();
            $table->date('hire_date')->nullable();
            $table->enum('employment_type', ['full_time', 'part_time', 'contract', 'intern'])->default('full_time')->nullable();
            $table->enum('status', ['active', 'inactive', 'on_leave','terminated'])->default('active')->nullable();
            $table->decimal('salary', 10, 2)->nullable();
            $table->text('address')->nullable();
            $table->text('emergency_contact_name')->nullable();
            $table->text('emergency_contact_phone')->nullable();

            //
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropForeign(['departments_id']);
            $table->dropForeign(['positions_id']);
            $table->dropColumn([
                'departments_id',
                'positions_id',
                'employee_id',
                'phone',
                'date_of_birth',
                'hire_date',
                'employment_type',
                'status',
                'salary',
                'address',
                'emergency_contact_name',
                'emergency_contact_phone',
            ]);
            //
        });
    }
};
