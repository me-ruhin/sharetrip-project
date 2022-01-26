<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSaleMastersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sale_masters', function (Blueprint $table) {
            $table->id();
            $table->string('date')->default(date('Y-m-d'));
            $table->string('ref_number')->unique();
            $table->float('total',8,2)->comment('Total purchase amount');
            $table->float('discount',8,2)->default(0)->comment('Discount amount');
            $table->float('payment',8,2)->default(0)->comment('Total payment after purchase');
            $table->string('payment_type')->nullable()->comment('payment method ex: bKash,rocket,wallet..');
            $table->foreignId('customer_id')->nullable()->comment('customer reference');
            $table->foreign('customer_id')
                ->references('id')
                ->on('customers')
                ->onDelete('set null');
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
        Schema::dropIfExists('sale_masters');
    }
}
