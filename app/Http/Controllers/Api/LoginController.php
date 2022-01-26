<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Requests\LoginRequest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class LoginController extends BaseController
{


    public function login(Request $request)
    {


        $rules =  [
            'email' => 'required',
            'password' => 'required'
        ];
        $validate = Validator::make($request->all(), $rules);


        if ($validate->fails()) {
            return $this->errors($validate->errors(), 'Validation errors', 400);
        }
        if (Auth::attempt($request->all())) {
            $data = $this->generateToken();
            return $this->success(['token' => $data], 'User successfully logged', 200);
        }

        return $this->errors("Invalid cradentials", 'No user found with this credentials', 400);
    }

    public function generateToken()
    {
        return Auth::user()->createToken(env('APP_NAME'))->plainTextToken;
    }

    public function logout(Request $request)
    {
        Auth::user()->currentAccessToken()->delete();

        return $this->success([], 'User successfully log out', 200);
    }
}
