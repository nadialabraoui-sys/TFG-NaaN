<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MetodoPago;

class MetodoPagoController extends Controller
{
    public function index()
    {
        $metodosPago = MetodoPago::all();
        return response()->json($metodosPago);
    }

    public function misMetodosPago(Request $request)
    {
        $metodosPago = MetodoPago::where('id_usuario', $request->user()->id_usuario)->get();

        return response()->json($metodosPago);
    }

    public function show($id)
    {
        $metodoPago = MetodoPago::find($id);

        if (!$metodoPago) {
            return response()->json(['Error' => 'El método de pago no se ha encontrado'], 404);
        }

        return response()->json($metodoPago);
    }

    public function store(Request $request)
    {
        $metodoPago = MetodoPago::create($request->all());
        return response()->json($metodoPago, 201);
    }

    public function update(Request $request, $id){

        $metodoPago = MetodoPago::find($id);

        if (!$metodoPago) {
            return response()->json(['Error' => 'El método de pago no se ha encontrado'], 404);
        }

        $metodoPago->update($request->all());
        return response()->json($metodoPago, 201);
    }

    public function destroy($id)
    {
        $metodoPago = MetodoPago::find($id);

        if (!$metodoPago) {
            return response()->json(['Error' => 'El método de pago no se ha encontrado'], 404);
        }

        $metodoPago->delete();
        return response()->json(['Completado' => 'El método de pago se ha eliminado correctamente']);
    }

    public function togglePredeterminado($id)
    {
        $metodoPago = MetodoPago::find($id);

        if (!$metodoPago) {
            return response()->json(['Error' => 'El método de pago no se ha encontrado'], 404);
        }

        MetodoPago::where('id_usuario', $metodoPago->id_usuario)->update(['es_predeterminado' => 0]);

        $metodoPago->update(['es_predeterminado' => 1]);

        return response()->json(['Completado' => "Método de pago marcado como predeterminado"]);
    }
}
