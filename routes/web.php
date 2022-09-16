<?php

use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Application;
use App\Http\Controllers\Backend\CommunityController;
use App\Http\Controllers\FrontEnd\SubredditController;


Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/r/{slug}', [SubredditController::class, 'show'])->name('subreddit.show');

Route::group(['middleware' => ['auth', 'verified']], function(){

    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');

    Route::resource(name: '/dashboard/communities', controller:CommunityController::class);
});

require __DIR__.'/auth.php';
