<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TemperatureLog extends Model
{
    protected $fillable = [
        'refrigerator_id',
        'temperature',
        'logged_at'
    ];

    public function refrigerator()
    {
        return $this->belongsTo(Refrigerator::class);
    }
}