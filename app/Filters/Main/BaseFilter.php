<?php

namespace App\Filters\Main;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\MorphToMany;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Enum;

abstract class BaseFilter extends FormRequest
{

    // <editor-fold default-state="collapsed" desc="constants">

    protected const PAGE_PARAM_NAME = 'page';

    protected const PER_PAGE_PARAM_NAME = 'perPage';

    protected const KEYWORD_PARAM_NAME = 'keyword';

    protected const FILTERS_PARAM_NAME = 'filters';

    protected const ORDERS_PARAM_NAME = 'orders';

    protected const DEFAULT_OPERATION = '=';

    protected const OPERATIONS_MAP = [
        'like' => FilterOperation::Like,
        '=' => FilterOperation::EQ,
        '!=' => FilterOperation::NEQ,
        '>' => FilterOperation::GT,
        '>=' => FilterOperation::GTE,
        '<' => FilterOperation::LT,
        '<=' => FilterOperation::LTE,
        'include' => FilterOperation::Include,
    ];

    // </editor-fold>

    public function apply(Builder|MorphToMany $builder)
    {
        $filterData = $this->validated();

        $page = $filterData[self::PAGE_PARAM_NAME] ?? null;
        $perPage = $filterData[self::PER_PAGE_PARAM_NAME] ?? null;
        $filters = $filterData[self::FILTERS_PARAM_NAME] ?? null;
        $keyword = $filterData[self::KEYWORD_PARAM_NAME] ?? null;
        $orders = $filterData[self::ORDERS_PARAM_NAME] ?? null;

        if ($filters) {
            $builder = $this->filter($builder, $filters);
        }

        if ($keyword) {
            $builder = $this->search($builder, $this->normalizeKeyword(urldecode($keyword)));
        }

        if ($orders) {
            $builder = $this->order($builder, $orders);
        } else $builder = $this->defaultOrder(builder: $builder);

        return $this->paginate($builder, $page, $perPage);
    }

    public function applyForExport($builder, $filter, $order, $keyword)
    {
        $page = null;
        $perPage = null;
        $filters = $filter ?? null;
        $orders = $order ?? null;
        $keyword = $keyword ?? null;

        if ($filters) {
            $builder = $this->filter($builder, $filters);
        }

        if ($keyword) {
            $builder = $this->search($builder, $this->normalizeKeyword(urldecode($keyword)));
        }

        if ($orders) {
            $builder = $this->order($builder, $orders);
        } else {
            $builder = $this->defaultOrder($builder);
        }

        return $this->paginate($builder, $page, $perPage);
    }

    public function filter(Builder $builder, array $filters): Builder
    {

        //sort filters to sure be included filter  in the last
        usort($filters, function ($a, $b) {
            $aOperation = $a['operation'] ?? FilterOperation::EQ->value;
            $bOperation = $b['operation'] ?? FilterOperation::EQ->value;

            if ($aOperation === $bOperation) {
                return 0;
            }

            // Ensure the specified operation stays at the end
            return $aOperation === FilterOperation::Include->value ? 1 : -1;
        });

        foreach ($filters as $filter) {
            @['name' => $name, 'operation' => $operation, 'value' => $value] = $filter;

            $column = $this->attributesMap()[$name] ?? $name;

            $column = $this->TableName() . '.' . $column;
            $operation = $operation ? FilterOperation::from($operation) : FilterOperation::EQ;

            if (method_exists($this, $method = $name . 'Filter')) {
                $builder = $this->{$method}($builder, $column, $operation, $value);
            } else {
                $builder = $this->addFilter($builder, $column, $operation, $value);
            }
        }

        return $builder;
    }

    abstract protected function attributesMap(): array;

    // <editor-fold default-state="collapsed" desc="search">

    abstract protected function TableName(): string;

    protected function addFilter(Builder $builder, string $column, ?FilterOperation $operation, mixed $value): Builder
    {
        $operation ??= FilterOperation::EQ;

        if ($value === "null") {
            $value = null;
        }

        switch ($operation) {
            case FilterOperation::In:
                //if value was like 1,2,3,54 convert to array of ids
                if (is_string($value)) {
                    $value = explode(',', urldecode($value));
                    $value = array_map('intval', $value);
                }

                if (!is_array($value)) {
                    $value = [$value];
                }

                $builder->whereIn($column, $value);
                break;
            case FilterOperation::Include:
                //if value was like 1,2,3,54 convert to array of ids
                if (is_string($value)) {
                    $value = explode(',', urldecode($value));
                    $value = array_map('intval', $value);
                }

                if (!is_array($value)) {
                    $value = [$value];
                }

                $query = clone $builder;
                $builder->whereIn($column, $value);
                $builder->union($query);
                break;

            case FilterOperation::NotIn:
                //if value was like 1,2,3,54 convert to array of ids
                if (is_string($value)) {
                    $value = explode(',', urldecode($value));
                    $value = array_map('intval', $value);
                }

                if (!is_array($value)) {
                    $value = [$value];
                }

                $builder->whereNotIn($column, $value);
                break;

            default:
                $operation = array_search($operation, self::OPERATIONS_MAP) ?? self::DEFAULT_OPERATION;

                $builder->where($column, $operation, $value);
                break;
        }

        return $builder;
    }

    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="filter">

    abstract protected function search(Builder $builder, string $keyword): Builder;

    private function normalizeKeyword($keyword): string
    {
        return strtolower(trim($keyword));
    }

    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="order">

    private function order(Builder $builder, array $orders): Builder
    {
        foreach ($orders as $order) {
            @['name' => $name, 'direction' => $direction] = $order;

            $column = $this->attributesMap()[$name] ?? $name;

            $column = $this->TableName() . '.' . $column;

            if (method_exists($this, $method = $name . 'Order')) {
                $builder = $this->{$method}($builder, $column, $direction);
            } else {
                $builder = $this->addOrder($builder, $column, $direction);
            }
        }

        return $builder;
    }

    protected function addOrder(Builder $builder, string $column, ?string $direction = 'asc'): Builder
    {
        $direction ??= 'asc';
        return $builder->orderBy($column, $direction);
    }

    abstract function defaultOrder(Builder $builder);

    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="pagination">

    private function paginate(Builder|MorphToMany $builder, ?int $page, ?int $perPage)
    {
        if ($perPage && $perPage == -1 && $this instanceof ICanGetAll) {
            return $builder;
        }

        if (!$perPage || $perPage == -1 || $perPage < -1 || $perPage > 250) {
            $perPage = 2+($builder->getModel()->getPerPage());
        }

        return $builder->skip($perPage * ($page - 1))->take($perPage);
    }

    // </editor-fold>

    // <editor-fold default-state="collapsed" desc="rules">

    public function rules(): array
    {
        return [
            self::PAGE_PARAM_NAME => ['integer'],
            self::PER_PAGE_PARAM_NAME => ['integer'],

            self::KEYWORD_PARAM_NAME => ['string'],

            self::ORDERS_PARAM_NAME . '.*.name' => ['required', 'string', Rule::in($this->getAttributesNames())],
            self::ORDERS_PARAM_NAME . '.*.direction' => [Rule::in(['asc', 'desc'])],

            self::FILTERS_PARAM_NAME . '.*.name' => ['required', 'string', Rule::in($this->getAttributesNames())],
            self::FILTERS_PARAM_NAME . '.*.operation' => [Rule::in(FilterOperation::values())],
            self::FILTERS_PARAM_NAME . '.*.value' => ['nullable'],
        ];
    }

    private function getAttributesNames(): array
    {
        $names = [];
        foreach ($this->attributesMap() as $index => $value) {
            if (is_numeric($index)) {
                $names[] = $value;
            } else {
                $names[] = $index;
            }
        }
        return $names;
    }

    // </editor-fold>
}
