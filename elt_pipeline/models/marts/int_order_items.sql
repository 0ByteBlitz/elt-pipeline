SELECT
    line_items.order_item_key,
    line_items.part_key,
    line_items.line_number,
    line_items.quantity,
    line_items.extended_price,
    orders.order_key,
    orders.customer_key,
    orders.order_date,
    {{ discounted_amount('line_items.extended_price', 'line_items.discount_percentage') }} as discounted_amount
FROM
    {{ ref('staging_tpch_orders') }} as orders
JOIN
    {{ ref('staging_tpch_line_items') }} as line_items
ON
    orders.order_key = line_items.order_key
ORDER BY
    orders.order_key