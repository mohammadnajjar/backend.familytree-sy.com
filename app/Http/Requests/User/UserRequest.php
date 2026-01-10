<?php

namespace App\Http\Requests\User;

use App\Enums\User\UserStatus;
use App\Http\Requests\Base\BaseFromRequest;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Password;

class UserRequest extends BaseFromRequest
{
    protected array $attributesMap = [];

    public function rules(): array
    {
        $userId = $this->route('user');

        $rules = [
            'fullName' => ['required', 'string', 'max:255'],
            'mobile' => ['required', 'string', 'max:20', Rule::unique('users', 'mobile')->ignore($userId)],
            'email' => ['nullable', 'email', 'max:255', Rule::unique('users', 'email')->ignore($userId)],
            'password' => ['nullable', Password::min(6)],
            'status' => ['nullable', Rule::in(UserStatus::values())],
            'imageId' => ['nullable', 'exists:media,id'],
            'attachmentId' => ['nullable', 'exists:media,id'],
            'roles' => ['nullable', 'array'],
            'roles.*' => ['exists:roles,id'],
        ];

        if ($this->isMethod('POST')) {
            $rules['password'] = ['required', Password::min(6)];
        }

        return $rules;
    }

    public function getData(): array
    {
        $data = [
            'full_name' => $this->input('fullName'),
            'mobile' => $this->input('mobile'),
            'email' => $this->input('email'),
            'status' => $this->input('status'),
            'image_id' => $this->input('imageId'),
            'attachment_id' => $this->input('attachmentId'),
            'roles' => $this->input('roles'),
        ];

        if ($this->filled('password')) {
            $data['password'] = bcrypt($this->input('password'));
        }

        return array_filter($data, fn($value) => $value !== null);
    }
}
