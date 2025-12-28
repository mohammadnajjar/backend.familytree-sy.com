<?php

namespace App\Http\Requests\Node;

use Illuminate\Foundation\Http\FormRequest;

class FamilyTreePdfRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true; // Authorization handled in controller
    }

    /**
     * Get the validation rules that apply to the request.
     */
    public function rules(): array
    {
        return [
            'root_node_id' => 'sometimes|integer|exists:nodes,id',
            'orientation' => 'sometimes|string|in:portrait,landscape',
            'include_photos' => 'sometimes|boolean',
            'max_generations' => 'sometimes|integer|min:1|max:10',
        ];
    }

    /**
     * Get custom validation messages.
     */
    public function messages(): array
    {
        return [
            'root_node_id.exists' => 'العقدة المحددة غير موجودة',
            'orientation.in' => 'اتجاه الصفحة يجب أن يكون portrait أو landscape',
            'max_generations.min' => 'يجب أن يكون عدد الأجيال أكبر من 0',
            'max_generations.max' => 'عدد الأجيال لا يجب أن يتجاوز 10',
        ];
    }

    /**
     * Get validated and formatted data.
     */
    public function getData(): array
    {
        return [
            'root_node_id' => $this->input('root_node_id'),
            'orientation' => $this->input('orientation', 'landscape'),
            'include_photos' => $this->boolean('include_photos', false),
            'max_generations' => $this->input('max_generations', 5),
        ];
    }
}
