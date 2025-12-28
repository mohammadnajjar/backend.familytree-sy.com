<?php

namespace App\Http\Controllers;

use App\Filters\PhotographFilter;
use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\Photograph\PhotographRequest;
use App\Http\Resources\Medium\MediumLight;
use App\Http\Resources\Photograph\PhotographImagesOnly;
use App\Http\Resources\Photograph\PhotographList;
use App\Http\Resources\Photograph\PhotographDetails;
use App\Http\Services\NotificationService;
use App\Http\Services\PhotographService;
use App\Models\Photograph;
use App\Notifications\NewPhotographNotification;

class PhotographController extends BaseController
{
    private PhotographService $photographService;
    private NotificationService $notificationService;

    public function __construct(PhotographService $photographService, NotificationService $notificationService)
    {
        $this->photographService = $photographService;
        $this->notificationService = $notificationService;

        $this->middleware('auth:sanctum')->except(['index', 'show']);
//        $this->authorizeResource(Photograph::class);
    }

    public function index(PhotographFilter $filter)
    {
        // Allow public access - no authorization needed

        $query = $this->photographService->getAll($filter);

        $light = request('light', 0);
        if ($light == 'true' || $light == 1) {
            return PhotographList::query($query);
        }

        return PhotographList::query($query);
    }

    public function allPhotographs(PhotographFilter $filter)
    {
        $this->authorize('viewAny', Photograph::class);

        $query = $this->photographService->getAll($filter)->with('images')->get();
        $allImages = $query->flatMap(function ($photo) {
            return $photo->images;
        });
        return response()->json([
            'images' => MediumLight::collection($allImages),
        ]);
    }

    public function myPhotographs(PhotographFilter $filter)
    {
        $this->authorize('viewAny', Photograph::class);

        $user = auth()->user();

        $photographs = Photograph::where('created_by', $user->id)->get();

        return PhotographList::collection($photographs);
    }

    public function store(PhotographRequest $request): PhotographDetails
    {
        $this->authorize('create', Photograph::class);

        $photograph = $this->photographService->create($request->getData());
        $notification = new NewPhotographNotification($photograph);
        $this->notificationService->sendToAll($notification, auth()->id());

        return new PhotographDetails($photograph);
    }

    public function show(mixed $id): PhotographDetails
    {
        $photograph = $this->photographService->find($id);
        $this->authorize('view', $photograph);

        return new PhotographDetails($photograph);
    }

    public function update(mixed $id, PhotographRequest $request): PhotographDetails
    {
        $photograph = $this->donationService->find($id);
        $this->authorize('update', $photograph);
        $photograph = $this->photographService->update($id, $request->getData());

        return new PhotographDetails($photograph);
    }

    public function destroy(mixed $id)
    {

        $photograph = $this->donationService->find($id);
        $this->authorize('delete', $photograph);
        $this->photographService->delete($id);

        return response()->noContent();
    }
}
