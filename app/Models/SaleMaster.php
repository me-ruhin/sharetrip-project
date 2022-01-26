<?php

namespace App\Models;

use App\Http\Resources\SellReportResource;
use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SaleMaster extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['ref_number', 'total', 'discount', 'payment', 'payment_type', 'customer_id'];

    protected $appends = ['products'];

    public function getsellshistory()
    {
        return new SellReportResource(SaleMaster::get());
    }

    public function getProductsAttribute()
    {
        return SaleDetail::where('ref_number', $this->ref_number)->get();
    }
    public function store($data)
    {
        try {
            SaleMaster::create($data);
            return true;
        } catch (Exception $e) {
            return false;
        }
    }
}
