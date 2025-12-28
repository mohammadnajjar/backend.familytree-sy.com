<?php

namespace App\Models\Base;

use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;

abstract class BaseModel extends Model
{
    use Userstamps;

    protected function newBaseQueryBuilder(): BaseQueryBuilder
    {
        $connection = $this->getConnection();

        return new BaseQueryBuilder(
            $connection, $connection->getQueryGrammar(), $connection->getPostProcessor()
        );
    }

    public static function usingSoftDeletes()
    {
        $usingSoftDeletes = null;

        if (is_null($usingSoftDeletes)) {
            return $usingSoftDeletes = in_array('Illuminate\Database\Eloquent\SoftDeletes', class_uses_recursive(get_called_class()));
        }

        return $usingSoftDeletes;
    }
}
