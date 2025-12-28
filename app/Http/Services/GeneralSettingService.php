<?php

namespace App\Http\Services;

use App\Models\GeneralSetting;
use App\Http\Services\Base\CrudService;
use Illuminate\Support\Facades\Cache;


class GeneralSettingService extends CrudService
{
    protected function getModelClass(): string
        {
            return GeneralSetting::class;
        }

    public function show()
    {
        return $this->getSetting();
    }

    public function edit(array $data)
    {
        $generalSetting = GeneralSetting::query()->firstOr(function () use ($data) {
            return GeneralSetting::query()->create($data);
        });

        $generalSetting->update($data);

        Cache::put('general_setting', $generalSetting, now()->addMinutes(60));
        return $generalSetting;
    }

    public function getSetting()
    {
        return GeneralSetting::firstOrFail();
    }

}
