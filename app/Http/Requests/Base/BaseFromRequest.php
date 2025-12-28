<?php

namespace App\Http\Requests\Base;

use Illuminate\Foundation\Http\FormRequest;

class BaseFromRequest extends FormRequest
{
    /**
     * $attributesMap = [
     *      'userId' => 'user_id',
     * ];
     */
    protected array $attributesMap = [];


    public function getData(): array
    {
        // Get the validated data
        $validatedData = $this->getValidateFromInput($this->validated());

        return $this->mapAttributes($validatedData);
    }

    protected function mapAttributes(mixed $attributes): mixed
    {
        if (!is_array($attributes)) {
            return $attributes;
        }

        $mappedAttributes = [];
        foreach ($attributes as $name => $value) {
            $attributeName = $name;
            if (array_key_exists($name, $this->attributesMap)) {
                $attributeName = $this->attributesMap[$name];
            }

            $mappedAttributes[$attributeName] = $this->mapAttributes($value);
        }

        return $mappedAttributes;
    }

    protected function getValidateFromInput(array $validatedData)
    {
        // Map and update the attributes using the input values
        foreach ($validatedData as $attributeName => $value) {
            // Get the original input value using input()
            $originalValue = $this->input($attributeName);

            // Use the original value if it exists, otherwise use the validated value
            $validatedData[$attributeName] = $originalValue ?? $value;
        }
        return $validatedData;
    }
}
