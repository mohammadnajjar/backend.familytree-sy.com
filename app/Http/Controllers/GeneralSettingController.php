<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\GeneralSetting\GeneralSettingRequest;
use App\Http\Resources\GeneralSetting\GeneralSettingDetails;
use App\Http\Services\GeneralSettingService;

class GeneralSettingController extends BaseController
{
    private GeneralSettingService $generalSettingService;

    public function __construct(GeneralSettingService $generalSettingService)
    {
        $this->generalSettingService = $generalSettingService;

        $this->middleware('auth:sanctum');
    }

    public function show(): GeneralSettingDetails
    {
        $setting = $this->generalSettingService->show();
         $this->authorize('view', $setting);
        return new GeneralSettingDetails($setting);
    }

    public function update(GeneralSettingRequest $request): GeneralSettingDetails
    {
        $setting = $this->generalSettingService->show();
        $this->authorize('update', $setting);
        $setting = $this->generalSettingService->edit($request->getData());
        return new GeneralSettingDetails($setting);
    }
}
