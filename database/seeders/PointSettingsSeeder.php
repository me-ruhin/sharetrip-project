<?php

namespace Database\Seeders;

use App\Models\PointSetting;
use Illuminate\Database\Seeder;

class PointSettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        PointSetting::create( [
                'minimun_purchase_amount'=>100,
                'acheive_point'=>1,
                'acheive_point_to_taka_conversion'=>1
                ]
        );
    }
}
