<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Task;
use Illuminate\Support\Facades\Storage;

class MigratePdfData extends Command
{
    protected $signature = 'migrate:pdf-data';
    protected $description = 'Migrate PDF data from material column to pdf_path';

    public function handle()
    {
        $tasks = Task::whereNotNull('material')->get();

        foreach ($tasks as $task) {
            // Ekstrak nama file dari string PDF
            preg_match('/(\w+\.pdf)/', $task->material, $matches);
            if (isset($matches[1])) {
                $filename = $matches[1];
                // Simpan string PDF sebagai file
                Storage::put('public/pdfs/' . $filename, $task->material);
                // Update record task
                $task->update(['pdf_path' => 'pdfs/' . $filename]);
            }
        }

        $this->info('PDF data migration completed.');
    }
}