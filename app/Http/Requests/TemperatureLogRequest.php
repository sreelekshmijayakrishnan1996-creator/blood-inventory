<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TemperatureLogRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'refrigerator_id' => 'required|exists:refrigerators,id',
            'temperature' => 'required|numeric|min:-20|max:10',
            'logged_at' => 'required|date',
        ];
    }
}
