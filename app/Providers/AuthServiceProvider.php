<?php

namespace App\Providers;

use App\Models\User;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use App\Models\{Achievement, City, Committee, Donation, HistoricalEvent, Member, Node, Photograph, GeneralSetting};
use App\Policies\{AchievementPolicy,
    CityPolicy,
    CommitteePolicy,
    DonationPolicy,
    HistoricalEventPolicy,
    MemberPolicy,
    PermissionPolicy,
    NodePolicy,
    PhotographPolicy,
    GeneralSettingPolicy};
use Spatie\Permission\Models\Permission;

class AuthServiceProvider extends ServiceProvider
{
    protected $policies = [
        User::class => MemberPolicy::class,
        Achievement::class => AchievementPolicy::class,
        Permission::class => PermissionPolicy::class,
        City::class => CityPolicy::class,
        Committee::class => CommitteePolicy::class,
        Donation::class => DonationPolicy::class,
        HistoricalEvent::class => HistoricalEventPolicy::class,
        Member::class => MemberPolicy::class,
        Node::class => NodePolicy::class,
        Photograph::class => PhotographPolicy::class,
        GeneralSetting::class => GeneralSettingPolicy::class,
    ];

    public function boot()
    {
        $this->registerPolicies();
    }
}
