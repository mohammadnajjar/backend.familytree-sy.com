<?php

namespace App\Http\Controllers;

use App\Enums\Donation\DonationStatus;
use App\Filters\DonationFilter;
use App\Http\Controllers\Base\BaseController;
use App\Http\Requests\Donation\DonationRequest;
use App\Http\Resources\Donation\DonationLight;
use App\Http\Resources\Donation\DonationList;
use App\Http\Resources\Donation\DonationDetails;
use App\Http\Services\DonationService;
use App\Http\Services\GeneralSettingService;
use App\Models\Donation;

class DonationController extends BaseController
{
    private DonationService $donationService;
    private GeneralSettingService $generalSettingService;

    public function __construct(DonationService $donationService, GeneralSettingService $generalSettingService)
    {
        $this->donationService = $donationService;
        $this->generalSettingService = $generalSettingService;

        $this->middleware('auth:sanctum');
//        $this->authorizeResource(Donation::class);
    }

    public function index(DonationFilter $filter)
    {
        $this->authorize('viewAny', Donation::class);

        $query = $this->donationService->getAll($filter);

        $light = request('light', 0);
        if ($light == 'true' || $light == 1) {
            return DonationLight::query($query);
        }

        return DonationList::query($query);
    }

    public function store(DonationRequest $request): DonationDetails
    {
        $this->authorize('create', Donation::class);

        $data = $request->getData();
        $donation = $this->donationService->create($data);
        $generalSetting = $this->generalSettingService->find(1);
        $generalSetting->box += $data['amount'];
        $generalSetting->save();
        return new DonationDetails($donation);
    }

    public function show(mixed $id): DonationDetails
    {
        $donation = $this->donationService->find($id);
        $this->authorize('view', $donation);

        return new DonationDetails($donation);
    }

    public function update(mixed $id, DonationRequest $request)
    {
        $donation = $this->donationService->find($id);
        $this->authorize('update', $donation);
        $data = $request->getData();
        $status = $data['status'];

        if (
            $status === DonationStatus::REJECTED->value &&
            $donation->status->value === DonationStatus::APPROVED->value
        ) {
            abort(400, 'Cannot reject an already approved donation.');
        }

        if (
            $donation->status->value === DonationStatus::APPROVED->value &&
            isset($data['amount']) &&
            $donation->amount != $data['amount']
        ) {
            abort(400, 'Cannot update amount of an already approved donation.');
        }

        $donation = $this->donationService->update($id, $request->getData());
        if ($status === DonationStatus::APPROVED->value) {
            if ($donation->status->value != DonationStatus::APPROVED->value) {
                $generalSetting = $this->generalSettingService->find(1);
                $generalSetting->box += $donation->amount;
                $generalSetting->save();
            }
        }
        return new DonationDetails($donation);
    }


    public function destroy(mixed $id)
    {
        $donation = $this->donationService->find($id);
        $this->authorize('delete', $donation);
        $this->donationService->delete($id);
        return response()->noContent();
    }
}
