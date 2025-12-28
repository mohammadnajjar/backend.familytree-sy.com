<?php

namespace App\Http\Services;

use App\Filters\Main\BaseFilter;
use App\Models\Base\BaseModel;
use App\Models\Medium;
use App\Models\Photograph;
use App\Http\Services\Base\CrudService;


class PhotographService extends CrudService
{
    protected function getModelClass(): string
        {
            return Photograph::class;
        }



    public function create(array $data): BaseModel
    {

        $photograph = $this->getQuery()->create($data);

        if (!empty($data['imageIds'])) {
            $this->setImages($photograph, $data['imageIds']);
        }

        return $photograph;
    }


    public function update(mixed $id, array $data)
    {
        $model = $this->find($id);
        $model->update($data);
        $this->setImages($model, $data['imageIds']);
        return $model;
    }

    public function setImages(BaseModel $photograph, $images)
    {
        if ($images) {
            $photograph->images()->sync($images);
        }
    }

    public function getAll(
        ?BaseFilter $filter = null,
        bool        $withTrashed = false,
        ?string     $orderByColumn = 'created_at',
        ?string     $orderByDirection = 'desc'
    ): \Illuminate\Database\Eloquent\Builder
    {
        // Call the parent getAll method to get the base query
        $query = $this->getQuery($withTrashed);
        // Add the orderBy clause
        $query->orderBy($orderByColumn, $orderByDirection);
        return $filter->apply($query);
    }

}
