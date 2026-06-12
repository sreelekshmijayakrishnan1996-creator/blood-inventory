<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BloodBank extends Model
{
    protected $fillable = ['name', 'location'];

    public function refrigerators()
    {
        return $this->hasMany(Refrigerator::class);
    }

    public function users()
    {
        return $this->belongsToMany(User::class);
    }
}