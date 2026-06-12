<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Refrigerator;
use Illuminate\Http\Request;
use App\Http\Requests\RefrigeratorRequest;

class RefrigeratorController extends Controller
{
    public function index()
    {
        $refrigerators = Refrigerator::with(['bloodBank', 'bloodBags', 'temperatureLogs'])
            ->withCount('bloodBags')
            ->latest()
            ->get();

        return response()->json([
            'status' => true,
            'data' => $refrigerators
        ]);
    }

    public function store(RefrigeratorRequest $request)
    {
        $refrigerator = Refrigerator::create($request->all());

        return response()->json([
            'status' => true,
            'message' => 'Refrigerator created successfully',
            'data' => $refrigerator
        ], 201);
    }

    public function show(string $id)
    {
        $refrigerator = Refrigerator::with([
            'bloodBank',
            'bloodBags',
            'temperatureLogs',
            'alerts'
        ])->findOrFail($id);

        return response()->json([
            'status' => true,
            'data' => $refrigerator
        ]);
    }

    public function update(RefrigeratorRequest $request, string $id)
    {
        $refrigerator = Refrigerator::findOrFail($id);

        $refrigerator->update($request->all());

        return response()->json([
            'status' => true,
            'message' => 'Refrigerator updated successfully',
            'data' => $refrigerator
        ]);
    }

    public function destroy(string $id)
    {
        $refrigerator = Refrigerator::findOrFail($id);
        $refrigerator->delete();

        return response()->json([
            'status' => true,
            'message' => 'Refrigerator deleted successfully'
        ]);
    }
}