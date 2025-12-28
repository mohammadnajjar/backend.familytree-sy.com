<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Notification\NotificationList;
use App\Http\Resources\Notification\NotificationDetails;
use App\Http\Services\NotificationService;
use App\Models\Notification;
use Illuminate\Http\Request;

class NotificationController extends BaseController
{
    private NotificationService $notificationService;

    public function __construct(NotificationService $notificationService)
    {
        $this->notificationService = $notificationService;

        $this->middleware('auth:sanctum');
        $this->authorizeResource(Notification::class);
    }

    public function index()
    {
        $query = $this->notificationService->allNotification();

        return NotificationList::query($query);
    }

    public function getMyNotification()
    {
        $query = $this->notificationService->getMyNotification();

        return NotificationList::query($query);
    }
    public function getCountNotification()
    {
        return $this->notificationService->getCountNotification();
    }

    public function store()
    {
        //
    }

    public function show(mixed $id): NotificationDetails
    {
        $notification = $this->notificationService->find($id);

        return new NotificationDetails($notification);
    }

    public function update()
    {
        //
    }

    public function destroy()
    {
        //
    }

    public function registerFcmToken(Request $request)
    {
        $request->validate([
            'fcm_token' => 'required|string|max:255',
        ]);

        $this->notificationService->registerFcmToken(auth()->user(), $request->fcm_token);

        return response()->noContent();
    }
}
