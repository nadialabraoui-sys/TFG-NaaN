<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DetalleCarrito;
use App\Models\Carrito;

class DetalleCarritoController extends Controller
{
    public function index()
    {
        $detalleCarritos = DetalleCarrito::all();
        return response()->json($detalleCarritos);
    }

    public function misDetallesCarrito(Request $request)
    {
        $idCarrito  = Carrito::where('id_usuario', $request->user()->id_usuario)->first();
        
        $detalleCarrito = DetalleCarrito::where('id_carrito', $idCarrito->id_carrito)->get();

        return response()->json($detalleCarrito);
    }

    public function show($id)
    {
        $detalleCarrito = DetalleCarrito::find($id);

        if (!$detalleCarrito) {
            return response()->json(['Error' => 'El detalle de este carrito no se ha encontrado'], 404);
        }

        return response()->json($detalleCarrito);
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_carrito' => 'required|exists:carrito,id_carrito',
            'id_producto' => 'required|exists:producto,id_producto',
            'cantidad' => 'required|integer|min:1',
            'precio_unitario' => 'required|numeric|min:0',
        ]);

        $detalleCarrito = DetalleCarrito::create($request->all());
        return response()->json($detalleCarrito, 201);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'cantidad' => 'required|integer|min:1',
        ]);

        $detalleCarrito = DetalleCarrito::find($id);

        if (!$detalleCarrito){
            return response()->json(['Error' => 'No encontrado']);
        }

        $detalleCarrito->update(['cantidad' => $request->cantidad]);
        return response()->json($detalleCarrito);
    }

    public function destroy($id)
    {
        $detalleCarrito = DetalleCarrito::find($id);

        if (!$detalleCarrito) {
            return response()->json(['Error' => 'El detalle de este carrito no se ha encontrado'], 404);
        }

        $detalleCarrito->delete();
        return response()->json(['Completado' => 'Los detalles de este carrito han sido eliminados']);
    }
}
