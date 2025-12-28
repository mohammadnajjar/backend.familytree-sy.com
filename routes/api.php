<?php

use App\Http\Controllers\AchievementController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CityController;
use App\Http\Controllers\CommitteeController;
use App\Http\Controllers\DonationController;
use App\Http\Controllers\CommitteeEventController;
use App\Http\Controllers\GeneralSettingController;
use App\Http\Controllers\HistoricalEventController;
use App\Http\Controllers\MediumController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\MemberStatisticController;
use App\Http\Controllers\NodeController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\PhotographController;
use App\Http\Controllers\RequestJoinController;
use App\Http\Services\NotificationService;
use App\Notifications\RequestJoinNotification;
use App\Http\Controllers\PermissionController;
use Illuminate\Support\Facades\Route;

/*
 * Auth Routes
 */
Route::group(['prefix' => 'auth'], function () {
    Route::post('send-otp', [AuthController::class, 'sendOtp']);
    Route::post('login-admin', [AuthController::class, 'login']);
    Route::post('login-member', [AuthController::class, 'loginMember']);

    Route::post('logout', [AuthController::class, 'logout']);

    Route::get('me', [AuthController::class, 'getMe']);
    Route::get('member/me', [AuthController::class, 'clientGetMe']);
    Route::get('me', [AuthController::class, 'getMe']);
    Route::put('me', [AuthController::class, 'updateMe']);
    Route::get('member/me', [AuthController::class, 'memberGetMe']);
    Route::put('member/me', [AuthController::class, 'memberUpdateMe']);

});

/*
 * Notification Routes
 */
Route::post('notification/register-fcm-token', [NotificationController::class, 'registerFcmToken']);
Route::get('notification/me', [NotificationController::class, 'getMyNotification']);
Route::get('notification-count/me', [NotificationController::class, 'getCountNotification']);


/*
 * Request Routes
 */
Route::apiResource('request', RequestJoinController::class)->only(['index', 'store', 'show']);
Route::post('request/review', [RequestJoinController::class, 'review']);
Route::post('request/finalize', [RequestJoinController::class, 'finalize']);

/*
 * Node Routes
 */
Route::apiResource('nodes', NodeController::class)->except(['destroy']);
Route::get('get-nodes-with-children', [NodeController::class,'getNodesWithChildren']);
Route::post('nodes/match', [NodeController::class, 'match']);
Route::post('nodes/create-pending', [NodeController::class, 'createPending']);
Route::post('nodes/link-to-node', [NodeController::class, 'linkToNode']);
Route::get('nodes/{id}/children', [NodeController::class, 'getChildrenOfNode']);

/*
 * HistoricalEvent Routes
 */
Route::apiResource('historical_event', HistoricalEventController::class);
Route::get('historical_event/my', [HistoricalEventController::class, 'myHistoricalEvents']);

/*
* Achievement Routes
*/
Route::apiResource('achievement', AchievementController::class);
Route::get('achievement/my', [AchievementController::class, 'myAchievements']);

/*
* Photograph Routes
*/
Route::apiResource('photograph', PhotographController::class);
Route::get('all-photographs', [PhotographController::class, 'allPhotographs']);
Route::get('photograph/my', [PhotographController::class, 'myPhotographs']);

/*
* Committee Routes
*/
Route::apiResource('committee', CommitteeController::class);
Route::post('apply-committee', [CommitteeController::class,'applyToCommittee']);
Route::post('vote-to-candidate', [CommitteeController::class,'vote']);
Route::post('accept-candidate', [CommitteeController::class,'acceptCandidate']);

Route::get('get-candidates-committee/{id}', [CommitteeController::class, 'getCandidates']);
Route::get('my-committee', [CommitteeController::class, 'getMyApplications']);
Route::get('get-candidates', [CommitteeController::class, 'getAllCandidates']);
Route::post('get-candidate/{id}', [CommitteeController::class, 'getCandidate']);

/*
* Committee Events Routes
*/
Route::apiResource('committees-events', CommitteeEventController::class);
Route::get('committees/{committeeId}/events', [CommitteeEventController::class, 'getByCommittee']);


/*
* Donation Routes
*/
Route::apiResource('donation', DonationController::class);

Route::post('media/multiple', [MediumController::class, 'storeMultiple']);
Route::apiResource('/media', MediumController::class);

Route::get('get-member-statistic', [MemberStatisticController::class, 'getMemberStatistics']);
Route::get('get-admin-statistic', [MemberStatisticController::class, 'getAdminStatistics']);

Route::apiResource('members', MemberController::class)->only(['index', 'show']);

/*
* Cities Routes
*/
Route::apiResource('cities', CityController::class);

/*
* General Setting Routes
*/
Route::put('general-settings', [GeneralSettingController::class, 'update']);
Route::get('general-settings', [GeneralSettingController::class, 'show']);


Route::get("send_notification",function (){

    $notificationService = new notificationService();
    $notificationService->sendToAll(
        new RequestJoinNotification(16)
    );

});


Route::get('/permissions', [PermissionController::class, 'index']);
