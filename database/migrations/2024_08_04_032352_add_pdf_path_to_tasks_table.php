<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('tasks', function (Blueprint $table) {
            $table->string('pdf_path')->nullable()->after('task_name');
            // Jangan hapus kolom 'material' dulu, kita akan migrasi datanya nanti
        });
    }
    
    public function down()
    {
        Schema::table('tasks', function (Blueprint $table) {
            $table->dropColumn('pdf_path');
        });
    }
};
