<?php

namespace App\Listeners;

use App\Events\CriticalTemperatureDetected;
use App\Models\Alert;

class SendCriticalTemperatureAlert
{
    public function handle(CriticalTemperatureDetected $event): void
    {
        Alert::create([
            'refrigerator_id' => $event->temperatureLog->refrigerator_id,
            'type' => 'critical_temperature',
            'message' => 'Critical temperature above 8°C detected',
            'temperature' => $event->temperatureLog->temperature,
            'alerted_at' => now(),
        ]);
    }
}