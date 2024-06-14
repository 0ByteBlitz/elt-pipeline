SELECT
    *
FROM   
    {{ ref('fct_orders') }}
WHERE
    discounted_amount > 0