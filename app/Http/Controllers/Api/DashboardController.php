<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\BloodBag;
use App\Models\Refrigerator;
use App\Models\TemperatureLog;
use App\Models\Alert;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index()
    {
        return response()->json([
            'status' => true,
            'total_blood_bags' => BloodBag::count(),

            'available_stock_by_blood_group' => BloodBag::where('status', 'Available')
                ->selectRaw('blood_group, COUNT(*) as total_bags, SUM(quantity_ml) as total_ml')
                ->groupBy('blood_group')
                ->get(),

            'critical_temperature_alerts' => Alert::where('type', 'critical_temperature')->count(),

            'average_temperature_today' => round(
                TemperatureLog::whereDate('logged_at', Carbon::today())->avg('temperature'),
                2
            ),

            'total_expired_bags' => BloodBag::where('status', 'Expired')
                ->orWhereDate('expiry_date', '<', Carbon::today())
                ->count(),

            'active_refrigerators' => Refrigerator::where('status', 'active')->count(),

            'refrigerator_health_score' => $this->healthScore()
        ]);
    }

    private function healthScore()
    {
        $total = Refrigerator::count();

        if ($total == 0) {
            return 0;
        }

        $critical = Alert::whereDate('created_at', Carbon::today())->count();

        $score = 100 - (($critical / $total) * 100);

        return max(round($score, 2), 0);
    }
}