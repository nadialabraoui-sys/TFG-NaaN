<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\CategoriaController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\PedidoController;
use App\Http\Controllers\DetallePedidoController;
use App\Http\Controllers\CarritoController;
use App\Http\Controllers\DetalleCarritoController;

Route::post('/registro', [AuthController::class, 'registro']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

Route::get('/no-autenticado', function() {
    return response()->json(['Error' => 'No autenticado'], 401);
});

// Rutas públicas sin autenticación
Route::apiResource('productos', ProductoController::class)->only(['index', 'show']);
Route::apiResource('categorias', CategoriaController::class)->only(['index', 'show']);

// Rutas personalizadas con middleware propio para evitar los conflictos con apiResource
Route::get('productos/all', [ProductoController::class, 'indexAll'])->middleware(['auth:sanctum', 'admin']);
Route::get('carrito/mi-carrito', [CarritoController::class, 'miCarrito'])->middleware('auth:sanctum');
Route::get('pedidos/mis-pedidos', [PedidoController::class, 'indexOnly'])->middleware('auth:sanctum');
Route::get('detalle-pedidos/mis-detalles', [DetallePedidoController::class, 'misDetalles'])->middleware('auth:sanctum');
Route::get('detalle-carrito/mis-detalles-carrito', [DetalleCarritoController::class, 'misDetallesCarrito'])->middleware('auth:sanctum');

// Petición → auth:sanctum → no autenticado → /api/no-autenticado → JSON 401
Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('pedidos', PedidoController::class)->only(['show']);
    // Route::apiResource('carrito', CarritoController::class)->only(['store', 'destroy']);
    Route::apiResource('detalle-carrito', DetalleCarritoController::class)->only(['store', 'update', 'destroy']);
});

// Petición → auth:sanctum → admin → CategoriaController
Route::middleware(['auth:sanctum', 'admin'])->group(function () {
    Route::apiResource('productos', ProductoController::class)->except(['index', 'show']);
    Route::apiResource('categorias', CategoriaController::class)->except(['index', 'show']);
    Route::patch('productos/{id}/toggle', [ProductoController::class, 'toggleActivo']);
    Route::apiResource('usuarios', UsuarioController::class)->except(['store']);
    Route::patch('usuarios/{id}/toggle', [UsuarioController::class, 'toggleAdmin']);
    Route::apiResource('pedidos', PedidoController::class)->except(['show']);
    Route::patch('pedidos/{id}/avanzar-estado', [PedidoController::class, 'avanzarEstado']);
    Route::patch('pedidos/{id}/cancelar', [PedidoController::class, 'cancelar']);
    Route::apiResource('detalle-pedidos', DetallePedidoController::class)->except(['update']);
    Route::apiResource('carrito', CarritoController::class)->only(['index', 'show']);
    Route::apiResource('detalle-carrito', DetalleCarritoController::class)->only(['index', 'show']);
});