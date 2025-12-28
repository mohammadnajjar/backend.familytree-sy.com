<?php

namespace App\Http\Services;

use App\Http\Services\Base\CrudService;
use App\Models\Base\BaseModel;
use App\Models\Medium;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class MediumService extends CrudService
{
    protected function getModelClass(): string
    {
        return Medium::class;
    }

    public function create(array $data): BaseModel
    {
        /** @var UploadedFile $medium */
        $medium = $data['medium'];

        $path = 'media/' . str_replace('-', '/', $data['for']);
        $mediumName = $medium->hashName();
        $extension = $medium->extension();

        $medium->storeAs(
            $path,
            $mediumName,
            ['disk' => 'public']
        );

        return parent::create([
            'path' => $path . '/' . $mediumName,
            'extension' => $extension,
            'for' => $data['for'],
            'type' => $data['type'],
        ]);
    }

    public function createMultiple($data): array
    {
        return DB::transaction(function () use ($data) {
            $media = [];
            foreach ($data['media'] as $medium) {
                $media[] = $this->create($medium);
            }

            return $media;
        });
    }

    /**
     * clear all files or images not related
     * @return void
     */
    public function clearFiles()
    {
        $query = Medium::query()
            ->whereDoesntHave('users', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('banners', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('categories', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('mainCategories', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('discountCodes', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('medicalSpecialties', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('productPdf', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('StoreLogo', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('Stores', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('trademarks', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('recipes', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('recipesDoctor', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('products', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('homeHeaderClientEn', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('homeHeaderClientAr', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('homeHeaderClient', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('homeHeaderDriverEn', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('homeHeaderDriverAr', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('homeHeaderDriver', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('homeHeaderInvestorEn', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('homeHeaderInvestorAr', function ($query) {
                $query->withTrashed();
            })
            ->whereDoesntHave('homeHeaderInvestor', function ($query) {
                $query->withTrashed();
            });

        $queryDelete = clone $query;

        $media = $query->get();

        $queryDelete->delete();


        foreach ($media as $medium) {
            if (Storage::exists('public/' . $medium->path)) {
                Storage::delete('public/' . $medium->path);
            }
        }

    }

}
