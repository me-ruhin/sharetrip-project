<?php

use App\Models\PointSetting;
use Illuminate\Support\Facades\Log;

if (!function_exists('numberGenerator')) {
    function numberGenerator($prefix)
    {
        return $prefix . '-' . time();
    }
}

if (!function_exists('customerRewardPointCalculation')) {
    function customerRewardPointCalculation($amount)
    {
        $point = PointSetting::first();
        if($point->minimun_purchase_amount<=$amount){
         return   ($amount*$point->acheive_point)/$point->minimun_purchase_amount;
        }
        return 0;

    }
}

?>
