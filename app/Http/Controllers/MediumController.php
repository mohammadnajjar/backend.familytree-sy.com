<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\Medium\MediaRequest;
use App\Http\Requests\Medium\MediumRequest;
use App\Http\Resources\Medium\MediumDetails;
use App\Http\Services\MediumService;
use App\Models\Medium;

class MediumController extends BaseController
{
    private MediumService $mediumService;

    public function __construct(MediumService $mediumService)
    {
        $this->mediumService = $mediumService;
        $this->middleware('auth:sanctum')->except(['show']);
//        $this->authorizeResource(Medium::class);
    }

    public function store(MediumRequest $request)
    {
//        $this->authorize('create',Medium::class);
        $medium = $this->mediumService->create($request->getData());

        return new MediumDetails($medium);
    }

    public function storeMultiple(MediaRequest $request)
    {
//        $this->authorize('create',Medium::class);
        $media = $this->mediumService->createMultiple($request->validated());

        return MediumDetails::collection($media);
    }

    public function show(mixed $id)
    {
        $medium = $this->mediumService->find($id);
//        $this->authorize('view',$medium);

        return new MediumDetails($medium);
    }

    public function delete(){
        $medium = $this->mediumService->clearExcelFile();
    }
}
