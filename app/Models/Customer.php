<?php

namespace App\Models;

use App\Http\Resources\CustomerResource;
use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\PointSetting;

class Customer extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'mobile', 'acheive_point'];

    public $errors = [];
    protected $appends = ['available_balance','reward'];

    public function getAvailableBalanceAttribute()
    {

        $totalPoint  = $this->acheive_point;
        $pointSetting = PointSetting::first();
        if ($totalPoint >= $pointSetting->acheive_point) {
            return (($totalPoint * $pointSetting->acheive_point_to_taka_conversion) / $pointSetting->acheive_point);
        }
        return 0;

    }

    public function getRewardAttribute()
    {

       return $type = $this->acheive_point>=20000?'platinum':($this->acheive_point>=10000?'gold':($this->acheive_point>=5000?'silver':('')));

    }
    public function getCustomer()
    {
        $customers = Customer::get();
        return new CustomerResource($customers);
    }

    public function storeCustomer($data)
    {
        try {
            return Customer::create($data);
        } catch (\Exception $e) {
            $this->errors['message'] = $e->getMessage();
            $this->errors['code'] = $e->getCode();
        }
    }
    public function updateCustomer($data, $id)
    {
        if ($this->getCustomerById($id)) {
            try {
                return Customer::find($id)->update($data);
            } catch (\Exception $e) {
                return $this->errorMessage($e->getMessage(), $e->getCode());
            }
        }
        return $this->errorMessage('Invalid Customer Id', 404);
    }

    public function getCustomerById($productId)
    {
        $data = Customer::find($productId);

        if (!$data) {
            return $this->errorMessage('Invalid Customer Id', 404);
        }

        try {
            return $data;
        } catch (Exception $e) {
            return $this->errorMessage($e->getMessage(), $e->getCode());
        }
    }

    public function errorMessage($message, $code)
    {
        $this->errors['message'] = $message;
        $this->errors['code'] = $code;
        return false;
    }

    public function deleteCustomer($productId)
    {
        return Customer::find($productId)->delete();
    }

    public function updateCustomerStock($data)
    {

        if ($this->getCustomerById($data['product_id'])) {
            try {
                $result = Customer::find($data['product_id']);
                $result->available_qty += $data['stock_qty'];
                $result->save();
                return true;
            } catch (\Exception $e) {
                return $this->errorMessage($e->getMessage(), $e->getCode());
            }
        }
        return $this->errorMessage('Invalid Customer Id', 404);
    }
}
