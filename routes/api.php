<?php

use App\Http\Controllers\Api\CustomerController;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\SellController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('v1/login', [LoginController::class, 'login']);
Route::post('v1/logout', [LoginController::class, 'logout']);

//get logged user data
Route::middleware(['auth:sanctum'])->get('v1/user', function (Request $request) {
    return Auth::user();
});

Route::group(['prefix' => 'v1', 'middleware' => ['auth:sanctum']], function () {

    Route::apiResource('products', ProductController::class);
    Route::apiResource('customers', CustomerController::class);
    Route::post('products/stock/', [ProductController::class, 'stockProduct']);
    Route::get('sells', [SellController::class, 'getSellList']);
    Route::post('sells', [SellController::class, 'addSale']);
});
