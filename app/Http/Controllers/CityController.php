<?php

namespace App\Http\Controllers;

use App\Filters\CityFilter;
use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\City\CityRequest;
use App\Http\Resources\City\CityLight;
use App\Http\Resources\City\CityList;
use App\Http\Resources\City\CityDetails;
use App\Http\Services\CityService;
use App\Models\City;

class CityController extends BaseController
{
    private CityService $cityService;

    public function __construct(CityService $cityService)
    {
        $this->cityService = $cityService;

        $this->middleware('auth:sanctum')->except('index');
    }

    public function index(CityFilter $filter)
    {
        $query = $this->cityService->getAll($filter);

        $light = request('light', 0);
        if ($light == 'true' || $light == 1) {
            return CityLight::query($query);
        }

        return CityList::query($query);
    }

    public function store(CityRequest $request): CityDetails
    {
        $this->authorize('create', City::class);
        $city = $this->cityService->create($request->getData());

        return new CityDetails($city);
    }

    public function show(mixed $id): CityDetails
    {
        $city = $this->cityService->find($id);
        $this->authorize('view', $city);

        return new CityDetails($city);
    }

    public function update(mixed $id, CityRequest $request): CityDetails
    {
        $city = $this->cityService->find($id);
        $this->authorize('update', $city);
        $city = $this->cityService->update($id, $request->getData());

        return new CityDetails($city);
    }

    public function destroy(mixed $id)
    {
        $city = $this->cityService->find($id);
        $this->authorize('delete', $city);

        $this->cityService->delete($id);

        return response()->noContent();
    }
}
