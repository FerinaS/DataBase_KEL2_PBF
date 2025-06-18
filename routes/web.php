<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MahasiswaController;
Route::get('/dashboard', function () {
    return view('dashboard');
});


Route::resource('mahasiswa', MahasiswaController::class);
