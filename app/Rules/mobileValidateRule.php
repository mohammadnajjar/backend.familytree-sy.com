<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class mobileValidateRule implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param string $attribute
     * @param mixed $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        if (strtolower(env('APP_ENV')) == 'test') {
            $isString = is_string($value);
            $sizeTrue = strlen($value) === 9;
            $startTrue = substr($value, 0, 1) === '5';
            return $isString && $sizeTrue && $startTrue;
        } else {
            $isString = is_string($value);
            $sizeTrue = strlen($value) === 9;
            $startTrue = substr($value, 0, 1) === '9';
            return $isString && $sizeTrue && $startTrue;
        }
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'validation.custom.mobile';
    }
}
