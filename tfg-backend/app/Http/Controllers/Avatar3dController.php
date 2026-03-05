<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Avatar3d;

class Avatar3dController extends Controller
{
    public function index()
    {
        $avatares = Avatar3d::all();
        return response()->json($avatares);
    }

    public function miAvatar(Request $request)
    {
        $avatar = Avatar3d::where('id_usuario', $request->user()->id_usuario)->first();
        
        if (!$avatar) {
        return response()->json(['Error' => 'No tienes avatar'], 404);
        }

        return response()->json($avatar);
    }

    public function show($id)
    {
        $avatar = Avatar3d::find($id);

        if (!$avatar) {
            return response()->json(['Error' => 'El avatar no se ha encontrado'], 404);
        }

        return response()->json($avatar);
    }

    public function store(Request $request)
    {
        // Pasa el JSON a array de  PHP el $request->all()
        $avatar = Avatar3d::create($request->all());
        return response()->json($avatar, 201);
    }

    public function update(Request $request, $id){

        $avatar = Avatar3d::find($id);

        if (!$avatar) {
            return response()->json(['Error' => 'El avatar no se ha encontrado'], 404);
        }

        $avatar->update($request->all());
        return response()->json($avatar, 201);
    }

    public function destroy($id)
    {
        $avatar = Avatar3d::find($id);

        if (!$avatar) {
            return response()->json(['Error' => 'El avatar no se ha encontrado'], 404);
        }

        $avatar->delete();
        return response()->json(['Completado' => 'El avatar se ha eliminado correctamente']);
    }
}
