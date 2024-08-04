<?php

use App\Http\Controllers\DataAnalytics\WelcomeController;
use App\Http\Controllers\DataAnalytics\DashboardController;
use App\Http\Controllers\DataAnalytics\ReportsController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Auth;

// Route::prefix('data-analytics')->group(function () {
    
    
//     // Route::get('/dashboard', [DashboardController::class, 'index'])->name('data-analytics.dashboard');
//     // Route::get('/reports', [ReportsController::class, 'index'])->name('data-analytics.reports');
//     // Route::get('/reports/{id}', [ReportsController::class, 'show'])->name('data-analytics.reports.show');
//     // Route::any('/upload-data', [WelcomeController::class, 'uploadData'])->name('data-analytics.upload-data');
//     // Route::any('/process-data', [WelcomeController::class, 'processData'])->name('data-analytics.process-data');
//     // // Data Analysis
//     // Route::prefix('analysis')->controller(ReportsController::class)->group(function () {
//     //     Route::get('/', 'analysis')->name('data-analytics.analysis');
//     //     Route::get('/projects/{id}', 'projects')->name('data-analytics.projects');
//     //     Route::any('/upload-results', [ReportsController::class, 'uploadResults'])->name('data-analytics.upload-results');
//     //     Route::any('/view-results', [ReportsController::class, 'viewResults'])->name('data-analytics.view-results');
//     // });
// });

Route::middleware('auth')->group(function () {
	
	// Admin
	Route::get('python/topic', [DataAnalyticsController::class, 'index']);
	Route::post('android23/topic/add', [AndroidController::class, 'add']);
	Route::post('android23/topic/update/{id}', [AndroidController::class, 'update']);
	Route::get('android23/topic/delete/{id}', [AndroidController::class, 'delete']);
	Route::get('android23/topic/learning/{id}', [AndroidController::class, 'learning_view']);
	Route::post('android23/topic/learning/add/{id}/{tipe}', [AndroidController::class, 'learning_add']);
	Route::post('android23/topic/learning/update/{id}/{id_task}', [AndroidController::class, 'learning_update']);
	Route::get('android23/topic/learning/delete/{id}/{id_task}', [AndroidController::class, 'learning_remove']);

	// update data testcase
	Route::post('android23/topic/update-testcase', [AndroidController::class, 'learning_update_testcase']);
	Route::get('android23/topic/reset/{id_topic}/{id_task}', [AndroidController::class, 'learning_reset_testcase']);
	Route::get('android23/topic/remove-testcase/{id_topic}/{id_testcase}', [AndroidController::class, 'learning_remove_testcase']);
	Route::post('android23/topic/add-testcase/{id_topic}/{id_task}', [AndroidController::class, 'learning_add_testcase']);
});