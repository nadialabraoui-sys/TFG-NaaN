<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\CategoriaController;
use App\Http\Controllers\AuthController;

Route::post('/registro', [AuthController::class, 'registro']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

// Petición → auth:sanctum → no autenticado → /api/no-autenticado → JSON 401
Route::get('/no-autenticado', function() {
    return response()->json(['Error' => 'No autenticado'], 401);
});

Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('productos', ProductoController::class)->only(['index', 'show']);
    Route::apiResource('categorias', CategoriaController::class)->only(['index', 'show']);
});

// Petición → auth:sanctum → admin → CategoriaController
Route::middleware(['auth:sanctum', 'admin'])->group(function () {
    Route::apiResource('productos', ProductoController::class)->except(['index', 'show']);
    Route::apiResource('categorias', CategoriaController::class)->except(['index', 'show']);
    Route::get('productos/all', [ProductoController::class, 'indexAll']);
    Route::patch('productos/{id}/toggle', [ProductoController::class, 'toggleActivo']);
});