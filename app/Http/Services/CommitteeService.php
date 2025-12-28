<?php

namespace App\Http\Services;

use App\Enums\Committee\MemberStatus;
use App\Filters\Main\BaseFilter;
use App\Models\Base\BaseModel;
use App\Models\Committee;
use App\Http\Services\Base\CrudService;
use App\Models\Member;
use Illuminate\Database\Eloquent\Builder;
use Spatie\Permission\Models\Role;


class CommitteeService extends CrudService
{
    protected function getModelClass(): string
        {
            return Committee::class;
        }

    public function findWithVotesReceived(mixed $id)
    {
        return $this->getQuery()
            ->with([
                'members' => function ($query) {
                    $query->wherePivot('status', MemberStatus::APPROVED->value);
                }            ])
            ->findOrFail($id);
    }

    public function getCandidatesWithVotesReceived(mixed $id)
    {
        return $this->getQuery()
            ->with([
                'members' => function ($query) {
                    $query->wherePivot('status', MemberStatus::WAITING->value);
                }            ])
            ->findOrFail($id);
    }


    public function create(array $data): BaseModel
    {
        $permissions = $data['permissions'] ?? [];
        unset($data['permissions']);

        $committee = Committee::create($data);

        $role = Role::create(['name' => 'committee_' . $committee->id]);

        if (!empty($permissions)) {
            $role->syncPermissions($permissions);
        }

        return $committee;
    }

    public function update(mixed $id, array $data): Committee
    {
        $committee = Committee::findOrFail($id);

        $permissions = $data['permissions'] ?? [];
        unset($data['permissions']);

        $committee->update($data);

        $role = Role::firstOrCreate(['name' => 'committee_' . $committee->id]);

        if (!empty($permissions)) {
            $role->syncPermissions($permissions);
        }

        return $committee;
    }
}
