<?php

namespace App\Http\Controllers;

use App\Filters\UserFilter;
use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\User\UserRequest;
use App\Http\Resources\User\UserDetails;
use App\Http\Resources\User\UserList;
use App\Http\Services\UserService;
use App\Models\User;

class UserController extends BaseController
{
    private UserService $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
        $this->middleware('auth:sanctum');
    }

    public function index(UserFilter $filter)
    {
        $this->authorize('viewAny', User::class);
        $query = $this->userService->getAll($filter);

        return UserList::query($query);
    }

    public function store(UserRequest $request): UserDetails
    {
        $this->authorize('create', User::class);
        $data = $request->getData();
        $roles = $data['roles'] ?? null;
        unset($data['roles']);

        $user = $this->userService->create($data);

        if ($roles) {
            $user->syncRoles($roles);
        }

        return new UserDetails($user);
    }

    public function show(mixed $id): UserDetails
    {
        $user = $this->userService->find($id);
        $this->authorize('view', $user);

        return new UserDetails($user);
    }

    public function update(mixed $id, UserRequest $request): UserDetails
    {
        $user = $this->userService->find($id);
        $this->authorize('update', $user);

        $data = $request->getData();
        $roles = $data['roles'] ?? null;
        unset($data['roles']);

        $user = $this->userService->update($id, $data);

        if ($roles) {
            $user->syncRoles($roles);
        }

        return new UserDetails($user);
    }

    public function destroy(mixed $id)
    {
        $user = $this->userService->find($id);
        $this->authorize('delete', $user);

        $this->userService->delete($id);

        return response()->noContent();
    }
}
