<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Alert extends Model
{
    protected $fillable = [
        'refrigerator_id',
        'type',
        'message',
        'temperature',
        'alerted_at'
    ];

    public function refrigerator()
    {
        return $this->belongsTo(Refrigerator::class);
    }
}