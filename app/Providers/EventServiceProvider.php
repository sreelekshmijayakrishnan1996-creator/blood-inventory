<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use App\Events\CriticalTemperatureDetected;
use App\Listeners\SendCriticalTemperatureAlert;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        CriticalTemperatureDetected::class => [
            SendCriticalTemperatureAlert::class,
        ],
    ];
}