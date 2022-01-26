<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Product::create([
            'name'=>'Test Product',
            'purchase_price'=>120,
            'selling_price'=>150,
            'available_qty'=>100,
        ]);
    }
}
