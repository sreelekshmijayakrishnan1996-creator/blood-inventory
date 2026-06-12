<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BloodBag extends Model
{
    protected $fillable = [
        'refrigerator_id',
        'bag_number',
        'blood_group',
        'donor_name',
        'collection_date',
        'expiry_date',
        'quantity_ml',
        'status'
    ];

    public function refrigerator()
    {
        return $this->belongsTo(Refrigerator::class);
    }
}