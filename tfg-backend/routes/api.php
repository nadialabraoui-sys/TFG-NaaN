<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\CategoriaController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::apiResource('productos', ProductoController::class);
Route::get('productos/all', [ProductoController::class, 'indexAll']);
Route::apiResource('categorias', CategoriaController::class);
Route::patch('productos/{id}/toggle', [ProductoController::class, 'toggleActivo']);

/*
Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('productos', ProductoController::class)->only(['index', 'show']);
    Route::apiResource('categorias', CategoriaController::class)->only(['index', 'show']);
});

Route::middleware(['auth:sanctum', 'admin'])->group(function () {
    Route::apiResource('productos', ProductoController::class)->except(['index', 'show']);
    Route::apiResource('categorias', CategoriaController::class)->except(['index', 'show']);
    Route::get('productos/all', [ProductoController::class, 'indexAll']);
    Route::patch('productos/{id}/toggle', [ProductoController::class, 'toggleActivo']);
});
*/