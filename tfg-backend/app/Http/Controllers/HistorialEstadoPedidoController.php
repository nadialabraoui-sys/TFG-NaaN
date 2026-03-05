<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\HistorialEstadoPedido;

class HistorialEstadoPedidoController extends Controller
{
    public function index()
    {
        $historiales = HistorialEstadoPedido::all();
        return response()->json($historiales);
    }

    public function show($id)
    {
        $historial = HistorialEstadoPedido::find($id);

        if (!$historial) {
            return response()->json(['Error' => 'El historial no se ha encontrado'], 404);
        }

        return response()->json($historial);
    }

    public function update(Request $request, $id){

        $historial = HistorialEstadoPedido::where('id_pedido', $id)->whereIn('estado', ['entregado', 'cancelado'])->first();

        if (!$historial) {
            return response()->json(['Error' => 'No puedes añadir comentario en este momento'], 404);
        }

        $historial->update(['comentario' => $request->comentario]);
        return response()->json($historial, 201);
    }
}
