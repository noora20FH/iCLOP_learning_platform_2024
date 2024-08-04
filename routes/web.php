<?php

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DataController;

use Laravel\Socialite\Facades\Socialite;
use App\Http\Controllers\SocialController;
use App\Http\Controllers\MaterialController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::post('/login',[AuthController::class,'proses'])->name('login');
Route::post('/signup',[AuthController::class,'signup'])->name('post_signup');
Route::get('/auth/redirect', action:[AuthController::class, 'redirect'])->name(name:'google.redirect');  
Route::get('/google/redirect', action:[AuthController::class, 'googleCallback'])->name(name:'google.callback');    

Route::get('/make', function(){

	echo Hash::make("123");
});

Route::get('/', [DataController::class, 'index'])->middleware('guest')->name('route-guest');

Route::get('/signup', function () {
    return view('signup');
})->name('signup');

Route::post('/logoutt', [AuthController::class, 'logoutt'])
    ->name('logoutt');

// Route::group(["prefix" => 'test', 'middleware' => ['login'],  'as' => 'test.'], function(){
  

// Tambahkan middleware 'auth' ke rute-rute yang memerlukan autentikasi
Route::middleware(['auth'])->group(function () {
    Route::get('/dashboard-student', function () {
        return view('dashboard_student');
    })->name('dashboard-student');


    Route::get('/learning-student', [MaterialController::class, 'index'])->name('learning_student');

    Route::get('/material-detail', [MaterialController::class, 'materialDetail'])->name('material_detail');
    Route::get('/task/{taskId}', [MaterialController::class, 'showTask'])->name('task.show');
    Route::get('/task/{task}/download-pdf', [MaterialController::class, 'downloadPdf'])->name('task.download-pdf');
    Route::post('/logoutt', [AuthController::class, 'logoutt'])->name('logoutt');
    
});

// Route Node JS
require __DIR__ . '/nodejs_routes.php';

// Route Aplas

// Route Flutter

// Route
require __DIR__ . '/android23_routes.php';

require __DIR__ . '/php_routes.php';
require __DIR__ . '/phpunit_routes.php';
require __DIR__ . '/python_routes.php';
// });

