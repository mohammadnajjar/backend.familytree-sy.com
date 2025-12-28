<?php

namespace App\Http\Resources\Base;

use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\Relations\MorphToMany;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Log;

class BaseJsonResource extends JsonResource
{
    public static $wrap = null;

    public function __construct($resource)
    {
        if ($resource instanceof BaseModel) {
            $resource = self::loadRelations($resource);
        }

        parent::__construct($resource);
    }

    protected static function relations(): array
    {
        return [];
    }

    protected static function relationsCount(): array
    {
        return [];
    }

    protected static function relationsSum(): array
    {
        return [];
    }
    
    public static function query(Builder $builder, bool $paginate = true): AnonymousResourceCollection
    {
        $builder = self::withRelations($builder);

        $perPage = $builder->getQuery()->unions ? $builder->getQuery()->unionLimit : $builder->getQuery()->limit;

        //when perPage null return without pagination
       
       if(!$perPage){
          return parent::collection($builder->get());
       } 

       if (!$paginate) {
            // Remove limit and offset
        $builder->getQuery()->limit = null;
        $builder->getQuery()->offset = null;
        
        // If it's a union query, reset those constraints too
        if ($builder->getQuery()->unions) {
            $builder->getQuery()->unionLimit = null;
            $builder->getQuery()->unionOffset = null;
        }
            $data = parent::collection($builder->get());
            $total = $builder->toBase()->getCountForPagination();
            $data->additional = [
            'page' => 1,
            'perPage' => $total,
            'lastPage' => 1,
            'total' => $total
            ];
            return $data;
        }

        $offset = $builder->getQuery()->unions ? $builder->getQuery()->unionOffset : $builder->getQuery()->offset;
        $total = $builder->toBase()->getCountForPagination();

        $page = (int)ceil($offset / $perPage);
        $lastPage = max((int)ceil($total / $perPage), 1);
        $data = parent::collection($builder->get());
        $query = $builder->toSql();
        $bindings = $builder->getBindings();
        
        // Replace question marks with actual values
        $fullQuery = vsprintf(str_replace('?', '%s', $query), array_map(function ($binding) {
            return is_numeric($binding) ? $binding : "'{$binding}'";
        }, $bindings));
        
        Log::info('Executed SQL Query:', ['query' => $fullQuery]);
        $data->additional = [
            'page' => $page + 1,
            'perPage' => $perPage,
            'lastPage' => $lastPage,
            'total' => $total
        ];

        return $data;
    }
    
    public static function queryWithRelations(Builder $builder): Builder
    {
        return self::withRelations($builder);
    }

    public static function queryMorphMany(MorphMany $builder): AnonymousResourceCollection
    {
        $perPage = $builder->getBaseQuery()->limit;

        //when perPage null return without pagination
        if (!$perPage) {
            return parent::collection($builder->get());
        }

        $offset = $builder->getBaseQuery()->offset;
        $total = $builder->toBase()->getCountForPagination();

        $page = (int)ceil($offset / $perPage);
        $lastPage = max((int)ceil($total / $perPage), 1);

        $data = parent::collection($builder->get());
        $data->additional = [
            'page' => $page,
            'perPage' => $perPage,
            'lastPage' => $lastPage,
            'total' => $total
        ];

        return $data;
    }

    public static function queryMorphManyWithPage(MorphMany|MorphToMany $builder)
    {
        $perPage = $builder->getBaseQuery()->limit;
        //when perPage null return without pagination
        if (!$perPage) {
            return parent::collection($builder->get());
        }

        $offset = $builder->getBaseQuery()->offset;
        $total = $builder->toBase()->getCountForPagination();

        $page = (int)ceil($offset / $perPage);
        $lastPage = max((int)ceil($total / $perPage), 1);

        $data = parent::collection($builder->get());
        $data->additional = [
            'page' => $page,
            'perPage' => $perPage,
            'lastPage' => $lastPage,
            'total' => $total
        ];


        return [$data, [
            'page' => $page,
            'perPage' => $perPage,
            'lastPage' => $lastPage,
            'total' => $total
        ]];
    }

    private static function withRelations(Builder $builder): Builder
    {
        $builder->with(static::relations());
        $builder->withCount(static::relationsCount());
        foreach (static::relationsSum() as $relation => $colum) {
            $builder->withSum($relation, $colum);
        }

        return $builder;
    }

    private static function loadRelations(BaseModel $model): BaseModel
    {
        $model->loadMissing(static::relations());

        if (count(static::relationsCount()) > 0) {
            $model->loadCount(static::relationsCount());
        }

        foreach (static::relationsSum() as $relation => $colum) {
            $model->loadSum($relation, $colum);
        }

        return $model;
    }
}
