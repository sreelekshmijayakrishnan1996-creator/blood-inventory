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
        Schema::create('blood_bags', function (Blueprint $table) {
    $table->id();
    $table->foreignId('refrigerator_id')->constrained()->cascadeOnDelete();
    $table->string('bag_number')->unique();
    $table->string('blood_group');
    $table->string('donor_name');
    $table->date('collection_date');
    $table->date('expiry_date');
    $table->integer('quantity_ml');
    $table->enum('status', ['Available', 'Reserved', 'Dispatched', 'Expired'])->default('Available');
    $table->timestamps();
});
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('blood_bags');
    }
};
