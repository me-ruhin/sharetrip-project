<?php

namespace App\Http\Controllers\Api;

use App\Models\SaleDetail;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\SaleMaster;
use Exception;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class SellController extends BaseController
{

    public $saleData;
    public $refNumber;
    public $saleMasterData;
    public function __construct(SaleDetail $saleDetailObj, SaleMaster $saleMasterObj)
    {
        $this->saleData = $saleDetailObj;
        $this->saleMasterData = $saleMasterObj;
    }
    public function getSellList()
    {
        return $this->saleMasterData->getsellshistory();
    }

    public function addSale(Request $request)
    {

        $rules = [
            'customer_id' => 'required|exists:customers,id',
            'total' => 'required',
        ];
        $validate = Validator::make($request->all(), $rules);

        if ($validate->fails()) {
            return $this->errors($validate->errors(), 'Validation errors', 400);
        }

        $productList = $request->except(['total', 'discount', 'payment', 'payment_type', 'customer_id']);
        $this->refNumber = numberGenerator('sell');
        $masterData = $request->merge(['ref_number' => $this->refNumber])->only(['ref_number', 'total', 'discount', 'payment', 'payment_type', 'customer_id']);
        DB::beginTransaction();
        try {
            $saleData = $this->saleData->store($productList,  $this->refNumber);
            $saleMasterData = $this->saleMasterData->store($masterData, $this->refNumber);
            $rewardPoint = $this->addCustomerRewardPoint($masterData['customer_id'], $masterData['total']);
            DB::commit();
            return $this->success('successfully sold out', 'success', 200);
        } catch (Exception $e) {
            DB::rollback();
            return $this->errors('something went wrong', 'server error', 500);
        }
    }

    public function addCustomerRewardPoint($customerId, $totalAmount)
    {
        $totalRewardPoint = customerRewardPointCalculation($totalAmount);
        $customer = Customer::findOrFail($customerId);
        $customer->acheive_point += $totalRewardPoint;
        return $customer->save();
    }
}
