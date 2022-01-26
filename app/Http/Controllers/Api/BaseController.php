<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BaseController extends Controller
{
    public function errors($data,$message = "",$code = 400){
        $response = [];
        $response['message']=$message;
        $response['errors']=$data;
        return response()->json($response,$code);
    }

    public function success($data,$message = "",$code = 200){

        $response = [];
        $response['message']=$message;
        $response['data']=$data;
        return response()->json($response,$code);
    }
}
