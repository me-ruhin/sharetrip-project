<?php

namespace Database\Seeders;

use App\Models\RewardSetting;
use Illuminate\Database\Seeder;

class RewardSettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        RewardSetting::insert([
            ["name"=>'silver',"minimum_acheive_point"=>5000],
            ["name"=>'gold',"minimum_acheive_point"=>10000],
            ["name"=>'platinum',"minimum_acheive_point"=>20000]
        ]
        );
    }
}
