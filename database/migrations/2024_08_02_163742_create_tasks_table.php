<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTasksTable extends Migration
{
    public function up()
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('material_id');
            $table->string('task_name')->nullable();
            $table->string('material')->nullable(); // Untuk menyimpan path file PDF
            $table->timestamps();

            $table->foreign('material_id')->references('id')->on('materials')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('tasks');
    }
}