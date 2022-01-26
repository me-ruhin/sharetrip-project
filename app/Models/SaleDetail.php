<?php

namespace App\Models;

use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class SaleDetail extends Model
{
    use HasFactory;
    public $errors = [];
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['ref_number', 'product_id', 'qty', 'price'];

    public function store($data, $ref_number)
    {
        DB::beginTransaction();
        try {
            foreach ($data['product'] as $key => $product) {
                $this->productStockAdjustment($product, new Product());
                SaleDetail::create([
                    'ref_number' => $ref_number, 'product_id' => $product['product_id'], 'qty' => $product['qty'], 'price' => $product['selling_price']
                ]);
            }
            DB::commit();
            return true;
        } catch (Exception $e) {
            DB::rollBack();
            $this->errorMessage($e->getMessage(),$e->getCode());
            return false;
        }
    }

    public function errorMessage($message, $code)
    {
        $this->errors['message'] = $message;
        $this->errors['code'] = $code;
        return false;
    }

    public function productStockAdjustment($data, Product $productObj)
    {
        $productObj->productAdjustment($data);
    }
}
