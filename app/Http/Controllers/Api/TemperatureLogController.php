<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\TemperatureLog;
use App\Models\Alert;
use Illuminate\Http\Request;
use Carbon\Carbon;

class TemperatureLogController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'refrigerator_id' => 'required|exists:refrigerators,id',
            'temperature' => 'required|numeric',
            'logged_at' => 'nullable|date',
        ]);

        $temperature = $request->temperature;

        if ($temperature >= 2 && $temperature <= 6) {
            $status = 'Safe';
        } elseif ($temperature > 6 && $temperature <= 8) {
            $status = 'Warning';
        } else {
            $status = 'Critical';
        }

        $log = TemperatureLog::create([
            'refrigerator_id' => $request->refrigerator_id,
            'temperature' => $temperature,
            'logged_at' => $request->logged_at ?? now(),
        ]);

        if ($status === 'Critical') {
            Alert::create([
                'refrigerator_id' => $request->refrigerator_id,
                'type' => 'critical_temperature',
                'message' => 'Critical temperature detected above 8°C',
                'temperature' => $temperature,
                'alerted_at' => now(),
            ]);
        }

        return response()->json([
            'status' => true,
            'message' => 'Temperature log added successfully',
            'temperature_status' => $status,
            'data' => $log
        ], 201);
    }

    public function analysis($refrigerator_id)
    {
        $today = Carbon::today();

        $logs = TemperatureLog::where('refrigerator_id', $refrigerator_id)
            ->whereDate('logged_at', $today)
            ->get();

        $totalMinutes = $logs->count();
        $unsafeMinutes = $logs->where('temperature', '>', 6)->count();

        return response()->json([
            'status' => true,
            'refrigerator_id' => $refrigerator_id,
            'daily_average_temperature' => round($logs->avg('temperature'), 2),
            'highest_temperature' => $logs->max('temperature'),
            'lowest_temperature' => $logs->min('temperature'),
            'total_unsafe_minutes' => $unsafeMinutes,
            'risk_percentage' => $totalMinutes > 0
                ? round(($unsafeMinutes / $totalMinutes) * 100, 2)
                : 0
        ]);
    }
}