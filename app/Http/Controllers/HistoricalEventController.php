<?php

namespace App\Http\Controllers;

use App\Filters\HistoricalEventFilter;
use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\HistoricalEvent\HistoricalEventRequest;
use App\Http\Resources\HistoricalEvent\HistoricalEventLight;
use App\Http\Resources\HistoricalEvent\HistoricalEventList;
use App\Http\Resources\HistoricalEvent\HistoricalEventDetails;
use App\Http\Services\HistoricalEventService;
use App\Http\Services\NotificationService;
use App\Models\HistoricalEvent;
use App\Notifications\NewEventNotification;

class HistoricalEventController extends BaseController
{
    private HistoricalEventService $historicalEventService;
    private NotificationService $notificationService;

    public function __construct(HistoricalEventService $historicalEventService, NotificationService $notificationService)
    {
        $this->historicalEventService = $historicalEventService;
        $this->notificationService = $notificationService;

        $this->middleware('auth:sanctum')->except(['index', 'show']);
//        $this->authorizeResource(HistoricalEvent::class);
    }

    public function index(HistoricalEventFilter $filter)
    {
        // Allow public access - no authorization needed

        $query = $this->historicalEventService->getAll($filter);

        $light = request('light', 0);
        if ($light == 'true' || $light == 1) {
            return HistoricalEventLight::query($query);
        }

        return HistoricalEventList::query($query);
    }

    public function myHistoricalEvents(HistoricalEventFilter $filter)
    {
        $this->authorize('viewAny', HistoricalEvent::class);

        $user = auth()->user();

        $achievements = HistoricalEvent::where('created_by', $user->id)->get();

        return HistoricalEventList::collection($achievements);
    }

    public function store(HistoricalEventRequest $request): HistoricalEventDetails
    {
        $this->authorize('create', HistoricalEvent::class);

        $historicalEvent = $this->historicalEventService->create($request->getData());
        $notification = new NewEventNotification($historicalEvent);
        $this->notificationService->sendToAll($notification, auth()->id());

        return new HistoricalEventDetails($historicalEvent);
    }

    public function show(mixed $id): HistoricalEventDetails
    {
        $historicalEvent = $this->historicalEventService->find($id);
        $this->authorize('view', $historicalEvent);

        return new HistoricalEventDetails($historicalEvent);
    }

    public function update(mixed $id, HistoricalEventRequest $request): HistoricalEventDetails
    {
        $historicalEvent = $this->donationService->find($id);
        $this->authorize('update', $historicalEvent);
        $historicalEvent = $this->historicalEventService->update($id, $request->getData());

        return new HistoricalEventDetails($historicalEvent);
    }

    public function destroy(mixed $id)
    {
        $historicalEvent = $this->donationService->find($id);
        $this->authorize('delete', $historicalEvent);
        $this->historicalEventService->delete($id);

        return response()->noContent();
    }
}
