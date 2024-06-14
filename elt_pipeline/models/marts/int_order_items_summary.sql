SELECT
    order_key,
    SUM(extended_price) as gross_item_sales_amount,
    SUM(discounted_amount) as net_item_sales_amount
FROM
    {{ ref('int_order_items') }}
GROUP BY
    order_key