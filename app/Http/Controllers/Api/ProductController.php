<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ProductRequest;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProductController extends BaseController
{
    public $product;

    /**
     *It will inject the Product class in Product Controller .
     *
     */

    public function __construct(Product $productObj)
    {
        $this->product = $productObj;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->product->getProduct();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'name' => 'required|unique:products,name',
            'purchase_price' => 'required',
            'selling_price' => 'required',
        ];

        $validate = Validator::make($request->all(), $rules);

        if ($validate->fails()) {
            return $this->errors($validate->errors(), 'Validation errors', 400);
        }

        $result = $this->product->storeProduct($request->all());
        if (!$result) {
            return   $this->errors($this->product->errors, $this->product->errors['message'], $this->product->errors['code']);
        }
        return $this->success($result, 'Product successfullly added', 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $result = $this->product->getProductById($id);
        if (!$result) {
            return   $this->errors($this->product->errors, $this->product->errors['message'], $this->product->errors['code']);
        }
        return $this->success($result, 'Product data found', 201);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $rules = [
            'name' => 'required|unique:products,name,' . $id,
            'purchase_price' => 'required',
            'selling_price' => 'required',
        ];

        $validate = Validator::make($request->all(), $rules);
        if ($validate->fails()) {
            return $this->errors($validate->errors(), 'Validation errors', 400);
        }

        $result = $this->product->updateProduct($request->all(), $id);
        if (!$result) {
            return  $this->errors($this->product->errors, $this->product->errors['message'], $this->product->errors['code']);
        }
        return $this->success($result, 'Product successfullly Update', 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if ($this->product->getProductById($id)) {
            $result =   $this->product->deleteProduct($id);
            return $this->success($result, 'Product successfullly deleted', 200);
        }
        return  $this->errors("Invalid product Id", 'validation error', 404);
    }


    /**
     * increase the stock of specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function stockProduct(request $request)
    {

        $rules = [
            'product_id' => 'required|exists:products,id',
            'stock_qty' => 'required',
        ];

        $validate = Validator::make($request->all(), $rules);
        if ($validate->fails()) {
            return $this->errors($validate->errors(), 'Validation errors', 400);
        }

        $result = $this->product->updateProductStock($request->all());
        if (!$result) {
            return  $this->errors($this->product->errors, $this->product->errors['message'], $this->product->errors['code']);
        }
        return $this->success($result, 'Product successfullly Update', 200);
    }
}
