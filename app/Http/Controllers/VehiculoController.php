<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Vehiculo;

class VehiculoController extends Controller
{
    //
    public function index(){

        $vehiculo = Vehiculo::all();

        $data = array(
            "status" => "success",
            "code" => "200",
            "headers" => [
                "Access-Control-Allow-Origin" => "*"
            ],
            "data" => $vehiculo
        );

        return response()->json($data, $data['code']);
    }
}
