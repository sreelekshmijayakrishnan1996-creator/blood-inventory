<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BloodBagController;
use App\Http\Controllers\Api\RefrigeratorController;
use App\Http\Controllers\Api\TemperatureLogController;
use App\Http\Controllers\Api\DashboardController;


Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::apiResource('blood-bags', BloodBagController::class);
    Route::apiResource('refrigerators', RefrigeratorController::class);
    Route::post('/temperature-logs', [TemperatureLogController::class, 'store']);
    Route::get('/temperature-analysis/{refrigerator_id}', [TemperatureLogController::class, 'analysis']);
    Route::get('/dashboard', [DashboardController::class, 'index']);
    Route::get('/blood-bags-expiring', [BloodBagController::class, 'expiringSoon']);
    Route::get('/expired-blood-bags', [BloodBagController::class, 'expired']);
    Route::get('/near-risk-percentage', [BloodBagController::class, 'nearRiskPercentage']);
});