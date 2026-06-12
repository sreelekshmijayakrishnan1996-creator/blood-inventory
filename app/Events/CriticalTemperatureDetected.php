<?php

namespace App\Events;

use App\Models\TemperatureLog;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class CriticalTemperatureDetected
{
    use Dispatchable, SerializesModels;

    public $temperatureLog;

    public function __construct(TemperatureLog $temperatureLog)
    {
        $this->temperatureLog = $temperatureLog;
    }
}