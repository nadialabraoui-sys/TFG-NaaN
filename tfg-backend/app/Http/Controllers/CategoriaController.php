<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use Illuminate\Http\Request;

class CategoriaController extends Controller
{
    public function index()
    {
        return response()->json(Categoria::all());
    }

    public function show($id)
    {
        $categoria = Categoria::find($id);
        if (!$categoria) {
            return response()->json(['Error' => 'Categoría no encontrada'], 404);
        }
        return response()->json($categoria);
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required|string|max:255',
            'descripcion' => 'nullable|string',
        ]);

        $categoria = Categoria::create($request->all());
        return response()->json($categoria, 201);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'nombre' => 'sometimes|string|max:255',
            'descripcion' => 'sometimes|nullable|string',
        ]);

        $categoria = Categoria::find($id);
        if (!$categoria) {
            return response()->json(['Error' => 'Categoría no encontrada'], 404);
        }
        $categoria->update($request->all());
        return response()->json($categoria);
    }

    public function destroy($id)
    {
        $categoria = Categoria::find($id);
        if (!$categoria) {
            return response()->json(['Error' => 'Categoría no encontrada'], 404);
        }
        $categoria->delete();
        return response()->json(['Completado' => 'Categoría eliminada']);
    }
}