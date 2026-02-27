<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Producto;

class ProductoController extends Controller
{
    public function indexAll()
    {
        $productos = Producto::all();
        return response()->json($productos);
    }

    public function index()
    {
        $productos = Producto::where('activo', true)->get();
        return response()->json($productos);
    }

    public function show($id)
    {
        $producto = Producto::find($id);

        if (!$producto) {
            return response()->json(['Error' => 'Producto no encontrado'], 404);
        }

        return response()->json($producto);
    }

    public function store(Request $request)
    {
        $producto = Producto::create($request->all());
        return response()->json($producto, 201);
    }

    public function update(Request $request, $id)
    {
        $producto = Producto::find($id);

        if (!$producto) {
            return response()->json(['Error' => 'Producto no encontrado'], 404);
        }

        $producto->update($request->all());
        return response()->json($producto);
    }

    public function destroy($id)
    {
        $producto = Producto::find($id);

        if (!$producto) {
            return response()->json(['Error' => 'Producto no encontrado'], 404);
        }

        $producto->update(['activo' => false]);
        return response()->json(['Completado' => 'Producto eliminado']);
    }

    public function toggleActivo($id)
    {
        $producto = Producto::find($id);

        if (!$producto) {
            return response()->json(['Error' => 'Producto no encontrado'], 404);
        }

        $producto->update(['activo' => !$producto->activo]);
        
        $estado = $producto->activo ? 'activado' : 'desactivado';
        return response()->json(['Completado' => "Producto $estado"]);
    }   
}