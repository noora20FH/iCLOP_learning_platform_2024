<?php

namespace App\Http\Controllers;

use App\Models\StudentSubmission;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;


class StudentSubmissionController extends Controller
{
    
    // // public function sendUrl(Request $request)
    // // {
    // //     $fileURL = $request->input('url');
    // //     // dd($fileURL);
    // //     $response = Http::asForm()->timeout(200000000000)->post('http://localhost:8080/api/run-python', [
    // //         'url' => $fileURL
    // //     ]);

    // //     if ($response) {
    // //         $data = $response->json();
    // //         // Return the data as JSON
    // //         return response()->json($data);
    // //     } else {
    // //         return response()->json(['message' => 'An errorcukihile submitting the request.'], 500);
    // //     }
    // // }

    // //NEW UPDATED
    // public function sendUrl(Request $request)
    // {
    //     $file = $request->file('file');
    //     $taskId = $request->input('task_id');
    
    //     if (!$file) {
    //         return response()->json(['message' => 'No file uploaded.'], 400);
    //     }
    
    //     $response = Http::attach(
    //         'file', file_get_contents($file), $file->getClientOriginalName()
    //     )->post('http://localhost:8080/api/run-python', [
    //         'task_id' => $taskId
    //     ]);
    
    //     if ($response->successful()) {
    //         $data = $response->json();
    //         return response()->json($data);
    //     } else {
    //         return response()->json(['message' => 'An error occurred while submitting the request.'], 500);
    //     }
    // }

    public function store(Request $request)
    {

        // dd($request->all());
        // $data = 
        $request->validate([
            'task_id' => 'required|exists:tasks,id',
            'answer_file' => 'required|' // Validasi untuk file Python
        ], [
            'answer_file.required' => 'File Python harus diunggah.',
            'answer_file.file' => 'Unggahan harus berupa file.',
            'answer_file.mimes' => 'File harus berekstensi .py (Python).',
            'answer_file.max' => 'Ukuran file tidak boleh lebih dari 2MB.'
        ]);

        // dd($data);

        $user = auth()->user();

        // Generate nama file yang unik
        $fileName = $user->id . '_' . $request->task_id . '_' . time() . '.py';

        // Simpan file dengan nama yang ditentukan
        $filePath = $request->file('answer_file')->storeAs('./public/submissions', $fileName, 'local');


    // Tambahkan kode debugging di sini
        \Log::info('File uploaded: ' . $filePath);
        if (Storage::disk('local')->exists($filePath)) {
            \Log::info('File exists at: ' . Storage::disk('local')->path($filePath));
        } else {
            \Log::error('File not found at: ' . Storage::disk('local')->path($filePath));
        }

        $task = Task::findOrFail($request->task_id);
        $existingSubmission = StudentSubmission::where('user_id', $user->id)
                                               ->where('task_id', $task->id)
                                               ->first();

        if ($existingSubmission) {
            // Jika sudah ada, update submission yang ada
            $submissionCount = $existingSubmission->submission_count + 1;
            $existingSubmission->update([
                'submission_count' => $submissionCount,
                'file_path' => $filePath,
            ]);
        } else {
            // Jika belum ada, buat submission baru
            $submissionCount = 1;
            StudentSubmission::create([
                'user_id' => $user->id,
                'task_id' => $task->id,
                'submission_count' => $submissionCount,
                'file_path' => $filePath,
            ]);
        }

        // Di sini Anda bisa menambahkan logika untuk menjalankan tes
        // dan menyimpan hasilnya ke $submission->test_result

        return redirect()->back()->with('success', 'Submission berhasil.');
    }
    // }


    // public function storeTestResult(Request $request)
    // {
    //     // Validasi request jika diperlukan
    //     $request->validate([
    //         'output' => 'required|string',
    //         'task_id' => 'required|exists:tasks,id',
    //     ]);

    //     // Mendapatkan pengguna yang sedang login
    //     $user_id = auth()->user()->id;

    //     // Mendapatkan data dari request
    //     $output = $request->input('output');
    //     $task_id = $request->input('task_id');

    //     // Mencari submission yang sesuai
    //     $submission = StudentSubmission::where('user_id', $user_id)
    //                                 ->where('task_id', $task_id)
    //                                 ->first();

    //     if ($submission) {
    //         // Update kolom test_result dengan data output
    //         $submission->update([
    //             'test_result' => $output,
    //         ]);

    //         // Mengembalikan respons sukses
    //         return response()->json(['message' => 'Data berhasil disimpan.', 'data' => $submission]);
    //     } else {
    //         // Jika submission tidak ditemukan, kembalikan respons error
    //         return response()->json(['message' => 'Submission tidak ditemukan.'], 404);
    //         }
    //     }

    public function show($id)
    {
        $submission = StudentSubmission::findOrFail($id);
        $task = Task::findOrFail($id);
        return view('task_detail', compact('submission','task'));
    }

    private function runTest(StudentSubmission $submission)
    {
        $testFilePath = storage_path('app/public/test_file/test_' . $submission->task_id . '.py');
        $submissionFilePath = storage_path('app/' . $submission->file_path);

        $process = new Process(['python', $testFilePath, $submissionFilePath]);
        $process->run();

        return $process->getOutput();
    }
}