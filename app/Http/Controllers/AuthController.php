<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\MemberMeRequest;
use App\Http\Requests\Auth\MeRequest;
use App\Http\Requests\Auth\SendOtpRequest;
use App\Http\Resources\Auth\LoginResponse;
use App\Http\Resources\Auth\MemberLoginResponse;
use App\Http\Resources\Member\MemberDetails;
use App\Http\Resources\User\UserDetails;
use App\Http\Services\AuthService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;

class AuthController extends BaseController
{
    public function __construct(private AuthService $authService)
    {
        $this->middleware('auth:sanctum')
            ->only([
                'logout',
                'getMe',
                'updateMe',
                'memberGetMe',
                'memberUpdateMe'
            ]);
    }

    public function sendOtp(SendOtpRequest $request): Response
    {
        $data = $request->getData();
        $mobile = $data['mobile'];
        $signature = $data['signature'] ?? null;
        $this->authService->sendOtp($mobile, $signature);
        return response()->noContent();
    }

    public function login(LoginRequest $request): LoginResponse
    {
        $data = $this->authService->login($request->validated());
        return new LoginResponse($data);
    }

    public function loginMember(LoginRequest $request): MemberLoginResponse
    {
        $data = $this->authService->loginMember($request->validated());
        return new MemberLoginResponse($data);
    }

    public function logout()
    {
        $this->authService->logout();
        return response()->noContent();
    }

    public function getMe(): UserDetails
    {
        $data = $this->authService->getMe();
        return new UserDetails($data['user']);
    }

    public function memberGetMe(): MemberDetails
    {
        $member = $this->authService->memberGetMe();
        return new MemberDetails($member);
    }

    public function updateMe(MeRequest $request): UserDetails
    {
        $member = $this->authService->updateMe($request->getData());
        return new UserDetails($member);
    }

    public function memberUpdateMe(MemberMeRequest $request): MemberDetails
    {
        $member = $this->authService->memberUpdateMe($request->getData());
        return new MemberDetails($member);
    }
}
