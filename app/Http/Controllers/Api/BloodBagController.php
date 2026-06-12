<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\BloodBag;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Http\Requests\BloodBagRequest;

class BloodBagController extends Controller
{
    public function index()
    {
        $bloodBags = BloodBag::with('refrigerator.bloodBank')->latest()->get();

        return response()->json([
            'status' => true,
            'data' => $bloodBags
        ]);
    }

    public function store(BloodBagRequest $request)
    {

        $bloodBag = BloodBag::create($request->all());

        return response()->json([
            'status' => true,
            'message' => 'Blood bag created successfully',
            'data' => $bloodBag
        ], 201);
    }

    public function show(string $id)
    {
        $bloodBag = BloodBag::with('refrigerator.bloodBank')->findOrFail($id);

        return response()->json([
            'status' => true,
            'data' => $bloodBag
        ]);
    }

    public function update(BloodBagRequest $request, string $id)
    {
        $bloodBag = BloodBag::findOrFail($id);

        $bloodBag->update($request->all());

        return response()->json([
            'status' => true,
            'message' => 'Blood bag updated successfully',
            'data' => $bloodBag
        ]);
    }

    public function destroy(string $id)
    {
        $bloodBag = BloodBag::findOrFail($id);
        $bloodBag->delete();

        return response()->json([
            'status' => true,
            'message' => 'Blood bag deleted successfully'
        ]);
    }

    public function expiringSoon()
{
    $bags = BloodBag::whereBetween('expiry_date', [
        Carbon::today(),
        Carbon::today()->addDay()
    ])->get();

    return response()->json([
        'status' => true,
        'message' => 'Blood bags expiring within 24 hours',
        'data' => $bags
    ]);
}

public function expired()
{
    $bags = BloodBag::whereDate('expiry_date', '<', Carbon::today())
        ->orWhere('status', 'Expired')
        ->get();

    return response()->json([
        'status' => true,
        'message' => 'Expired blood bags',
        'data' => $bags
    ]);
}

public function nearRiskPercentage()
{
    $totalBags = BloodBag::count();

    $nearRiskBags = BloodBag::whereBetween('expiry_date', [
        Carbon::today(),
        Carbon::today()->addDay()
    ])->count();

    $percentage = $totalBags > 0
        ? round(($nearRiskBags / $totalBags) * 100, 2)
        : 0;

    return response()->json([
        'status' => true,
        'near_risk_inventory_percentage' => $percentage
    ]);
}
}