<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Refrigerator extends Model
{
    protected $fillable = ['blood_bank_id', 'name', 'code', 'status'];

    public function bloodBank()
    {
        return $this->belongsTo(BloodBank::class);
    }

    public function bloodBags()
    {
        return $this->hasMany(BloodBag::class);
    }

    public function temperatureLogs()
    {
        return $this->hasMany(TemperatureLog::class);
    }

    public function alerts()
    {
        return $this->hasMany(Alert::class);
    }
}