<?php

namespace App\Models;

use App\Http\Resources\ProductResource;
use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    public $errors;
    use HasFactory;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'purchase_price', 'selling_price', 'available_qty'];

    public function getProduct()
    {
        $products = Product::get();
        return new ProductResource($products);
    }

    public function storeProduct($data)
    {
        try {
            return Product::create($data);
        } catch (Exception $e) {
            $this->errors['message'] = $e->getMessage();
            $this->errors['code'] = $e->getCode();
        }
    }
    public function updateProduct($data, $id)
    {
        if ($this->getProductById($id)) {
            try {
                return Product::find($id)->update($data);
            } catch (Exception $e) {
                return $this->errorMessage($e->getMessage(), $e->getCode());
            }
        }
        return $this->errorMessage('Invalid Product Id', 404);
    }

    public function getProductById($productId)
    {
        $data = Product::find($productId);

        if (!$data) {
            return $this->errorMessage('Invalid Product Id', 404);
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

    public function deleteProduct($productId)
    {
        return Product::find($productId)->delete();
    }

    public function updateProductStock($data)
    {

        if ($this->getProductById($data['product_id'])) {
            try {
                $result = Product::find($data['product_id']);
                $result->available_qty += $data['stock_qty'];
                $result->save();
                return true;
            } catch (Exception $e) {
                return $this->errorMessage($e->getMessage(), $e->getCode());
            }
        }
        return $this->errorMessage('Invalid Product Id', 404);
    }

    public function productAdjustment($data)
    {

        try {

            $product = Product::find($data['product_id']);
            $product->available_qty -= $data['qty'];
            $product->save();
        } catch (Exception $e) {
        }
    }
}
