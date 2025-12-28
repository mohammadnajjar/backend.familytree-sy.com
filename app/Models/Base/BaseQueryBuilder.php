<?php

namespace App\Models\Base;

use Illuminate\Database\Query\Builder;
use Illuminate\Database\Query\Expression;

class BaseQueryBuilder extends Builder
{
    public function join($table, $first, $operator = null, $second = null, $type = 'inner', $where = false)
    {
        if ($this->isJoinExists($table)) {
            return $this;
        }

        return parent::join($table, $first, $operator, $second, $type, $where);
    }

    public function isJoinExists($table): bool
    {
        $joins = collect($this->joins);
        return $joins->pluck('table')->contains($table);
    }

    protected function runPaginationCountQuery($columns = ['*'])
    {
        if ($this->groups || $this->havings) {
            $clone = $this->cloneForPaginationCount();

            if (is_null($clone->columns) && ! empty($this->joins)) {
                $clone->select($this->from.'.*');
            }

            return $this->newQuery()
                ->from(new Expression('('.$clone->toSql().') as '.$this->grammar->wrap('aggregate_table')))
                ->mergeBindings($clone)
                ->setAggregate('count', $this->withoutSelectAliases($columns))
                ->get()->all();
        }


        $without = $this->unions ? ['unionOrders', 'unionLimit', 'unionOffset'] : ['columns', 'orders', 'limit', 'offset'];

        return $this->cloneWithout($without)
            ->cloneWithoutBindings($this->unions ? ['order'] : ['select', 'order'])
            ->setAggregate('count', $this->withoutSelectAliases($columns))
            ->get()->all();
    }
}
