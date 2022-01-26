<?php

namespace App\Http\Controllers\Api;

use App\Models\Customer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class CustomerController extends BaseController
{

    public $customer;

    /**
     *It will inject the Customer class in CustomerController .
     *
     */

    public function __construct(Customer $customerObj)
    {
        $this->customer = $customerObj;
    }

     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->customer->getCustomer();
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
            'name' => 'required',
            'mobile' => 'required|unique:customers,mobile|min:11,max:13',
        ];

        $validate = Validator::make($request->all(), $rules);

        if ($validate->fails()) {
            return $this->errors($validate->errors(), 'Validation errors', 400);
        }

        $result = $this->customer->storeCustomer($request->all());
        if (!$result) {
            return   $this->errors($this->customer->errors, $this->customer->errors['message'], $this->customer->errors['code']);
        }
        return $this->success($result, 'Customer successfullly added', 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $result = $this->customer->getCustomerById($id);

        if (!$result) {
            return   $this->errors($this->customer->errors, $this->customer->errors['message'], $this->customer->errors['code']);
        }
        return $this->success($result, 'Customer data found', 201);
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
            'name' => 'required',
            'mobile' => 'required|unique:customers,mobile,'. $id,
        ];

        $validate = Validator::make($request->all(), $rules);
        if ($validate->fails()) {
            return $this->errors($validate->errors(), 'Validation errors', 400);
        }

        $result = $this->customer->updateCustomer($request->all(), $id);
        if (!$result) {
            return  $this->errors($this->customer->errors, $this->customer->errors['message'], $this->customer->errors['code']);
        }
        return $this->success($result, 'Customer successfullly Update', 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if ($this->customer->getCustomerById($id)) {
            $result =   $this->customer->deleteCustomer($id);
            return $this->success($result, 'Customer successfullly deleted', 200);
        }
        return  $this->errors("Invalid customer Id", 'validation error', 404);
    }


    /**
     * increase the stock of specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

}
