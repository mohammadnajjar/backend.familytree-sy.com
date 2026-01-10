<?php

namespace App\Http\Controllers;

use App\Filters\AchievementFilter;
use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\Achievement\AchievementRequest;
use App\Http\Resources\Achievement\AchievementLight;
use App\Http\Resources\Achievement\AchievementList;
use App\Http\Resources\Achievement\AchievementDetails;
use App\Http\Services\AchievementService;
use App\Http\Services\NotificationService;
use App\Models\Achievement;
use App\Notifications\NewAchievementNotification;

class AchievementController extends BaseController
{
    private AchievementService $achievementService;
    private NotificationService $notificationService;

    public function __construct(AchievementService $achievementService, NotificationService $notificationService)
    {
        $this->achievementService = $achievementService;
        $this->notificationService = $notificationService;


        $this->middleware('auth:sanctum')->except(['index', 'show']);
//        $this->authorizeResource(Achievement::class);
    }

    public function index(AchievementFilter $filter)
    {
        // Remove authorization check for public access
        // $this->authorize('viewAny', Achievement::class);
        $query = $this->achievementService->getAll($filter);

        $light = request('light', 0);
        if ($light == 'true' || $light == 1) {
            return AchievementLight::query($query);
        }

        return AchievementList::query($query);
    }

    public function myAchievements(AchievementFilter $filter)
    {
        $this->authorize('viewAny', Achievement::class);

        $user = auth()->user();

        $achievements = Achievement::where('created_by', $user->id)->get();

        return AchievementList::collection($achievements);
    }

    public function store(AchievementRequest $request): AchievementDetails
    {
        $this->authorize('create', Achievement::class);

        $achievement = $this->achievementService->create($request->getData());
        $notification = new NewAchievementNotification($achievement);
        $this->notificationService->sendToAll($notification, auth()->id());

        return new AchievementDetails($achievement);
    }

    public function show(mixed $id): AchievementDetails
    {
        $achievement = $this->achievementService->find($id);
        // Allow public access - no authorization needed for viewing

        return new AchievementDetails($achievement);
    }

    public function update(mixed $id, AchievementRequest $request): AchievementDetails
    {
        $achievementAuth = Achievement::find($id);
        $this->authorize('update', $achievementAuth);
        $achievement = $this->achievementService->update($id, $request->getData());

        return new AchievementDetails($achievement);
    }

    public function destroy(mixed $id)
    {
        $achievementAuth = Achievement::find($id);
        $this->authorize('delete', $achievementAuth);
        $this->achievementService->delete($id);

        return response()->noContent();
    }
}
