<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Direccion;

class DireccionController extends Controller
{
    public function index()
    {
        $direcciones = Direccion::all();
        return response()->json($direcciones);
    }

    public function misDirecciones(Request $request)
    {
        $direcciones = Direccion::where('id_usuario', $request->user()->id_usuario)->get();

        return response()->json($direcciones);
    }

    public function show($id)
    {
        $direccion = Direccion::find($id);

        if (!$direccion) {
            return response()->json(['Error' => 'La dirección no se ha encontrado'], 404);
        }

        return response()->json($direccion);
    }

    public function store(Request $request)
    {
        $direccion = Direccion::create($request->all());
        return response()->json($direccion, 201);
    }

    public function update(Request $request, $id){

        $direccion = Direccion::find($id);

        if (!$direccion) {
            return response()->json(['Error' => 'La dirección no se ha encontrado'], 404);
        }

        $direccion->update($request->all());
        return response()->json($direccion, 201);
    }

    public function destroy($id)
    {
        $direccion = Direccion::find($id);

        if (!$direccion) {
            return response()->json(['Error' => 'La dirección no se ha encontrado'], 404);
        }

        $direccion->delete();
        return response()->json(['Completado' => 'La direccion se ha eliminado correctamente']);
    }
}
