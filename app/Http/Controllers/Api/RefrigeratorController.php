<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Refrigerator;
use Illuminate\Http\Request;

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

    public function store(Request $request)
    {
        $request->validate([
            'blood_bank_id' => 'required|exists:blood_banks,id',
            'name' => 'required|string|max:255',
            'code' => 'required|string|unique:refrigerators,code',
            'status' => 'required|in:active,inactive',
        ]);

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

    public function update(Request $request, string $id)
    {
        $refrigerator = Refrigerator::findOrFail($id);

        $request->validate([
            'blood_bank_id' => 'required|exists:blood_banks,id',
            'name' => 'required|string|max:255',
            'code' => 'required|string|unique:refrigerators,code,' . $id,
            'status' => 'required|in:active,inactive',
        ]);

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