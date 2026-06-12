<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\BloodBag;
use Illuminate\Http\Request;

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

    public function store(Request $request)
    {
        $request->validate([
            'refrigerator_id' => 'required|exists:refrigerators,id',
            'bag_number' => 'required|unique:blood_bags,bag_number',
            'blood_group' => 'required',
            'donor_name' => 'required',
            'collection_date' => 'required|date',
            'expiry_date' => 'required|date|after:collection_date',
            'quantity_ml' => 'required|integer|min:1',
            'status' => 'required|in:Available,Reserved,Dispatched,Expired',
        ]);

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

    public function update(Request $request, string $id)
    {
        $bloodBag = BloodBag::findOrFail($id);

        $request->validate([
            'refrigerator_id' => 'required|exists:refrigerators,id',
            'bag_number' => 'required|unique:blood_bags,bag_number,' . $id,
            'blood_group' => 'required',
            'donor_name' => 'required',
            'collection_date' => 'required|date',
            'expiry_date' => 'required|date|after:collection_date',
            'quantity_ml' => 'required|integer|min:1',
            'status' => 'required|in:Available,Reserved,Dispatched,Expired',
        ]);

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
}