<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function registro(Request $request)
    {
        $usuario = User::create([
            'nombre' => $request->nombre,
            'email' => $request->email,
            'contrasena' => Hash::make($request->contrasena),
            'rol' => 'cliente',
            'telefono' => $request->telefono,
            'fecha_nacimiento' => $request->fecha_nacimiento
        ]);

        $token = $usuario->createToken('token_registro')->plainTextToken;

        return response()->json([
            'usuario' => $usuario,
            'token' => $token
        ], 201);
    }

    public function login(Request $request)
    {
        $usuario = User::where('email', $request->email)->first();

        if (!$usuario || !Hash::check($request->contrasena, $usuario->contrasena)) {
            return response()->json(['Error' => 'Credenciales incorrectas'], 401);
        }

        $token = $usuario->createToken('token_login')->plainTextToken;

        return response()->json([
            'usuario' => $usuario,
            'token'   => $token
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['Completado' => 'Sesión cerrada']);
    }
}