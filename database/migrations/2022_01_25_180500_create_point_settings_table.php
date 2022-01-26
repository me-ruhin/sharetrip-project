<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePointSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('point_settings', function (Blueprint $table) {
            $table->id();
            $table->float('minimun_purchase_amount',8,2)->comment('minimum purchase amount to acheive reward point');
            $table->float('acheive_point',8,2)->comment('point while match the minimun purchase amount');
            $table->float('acheive_point_to_taka_conversion',8,2)->comment('point to taka conversation . ex 1 point 1 taka');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('point_settings');
    }
}
