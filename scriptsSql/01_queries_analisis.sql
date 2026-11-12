//Contamos las órdenes únicas entregadas para evitar contar duplicados por ítems
SELECT COUNT(DISTINCT order_id) AS total_pedidos_entregados
FROM olist_order_items_dataset;
// Sumamos el valor de los productos vendidos
SELECT ROUND(SUM(price), 2) AS ventas_totales_brutas FROM  olist_order_items_dataset ooid 


-- Calculamos el valor promedio por ítem vendido
SELECT  ROUND(AVG(price), 2) AS ticket_promedio_producto FROM olist_order_items_dataset ooid


SELECT 
    c.customer_state AS estado,
    COUNT(DISTINCT o.order_id) AS total_pedidos,
    ROUND(SUM(i.price), 2) AS facturacion_total
FROM olist_orders_dataset o

JOIN olist_customers_dataset c 
    ON o.customer_id = c.customer_id

JOIN olist_order_items_dataset i 
    ON o.order_id = i.order_id

WHERE o.order_status = 'delivered'

GROUP BY c.customer_state

ORDER BY facturacion_total DESC

LIMIT 15;


WITH productosClientes AS (
    SELECT o.order_id,oi.product_id   FROM olist_orders_dataset o
    JOIN olist_order_items_dataset oi ON  o.order_id  == oi.order_id  
    WHERE  o.customer_id =='79de53946db384e2d7a9bd131792ad17'
    )
    
 SELECT p.product_id , p.product_category_name 
FROM productosClientes pc
JOIN olist_products_dataset p ON p.product_id  == pc.product_id 




-- USO DE WITH Y CROSS JOIN
WITH ventas_por_vendedor AS (
    SELECT 
        seller_id,
        ROUND(SUM(price), 2) AS total_vendido
    FROM olist_order_items_dataset
    GROUP BY seller_id
),

-- Paso 2: Creamos una segunda CTE que calcula el promedio global de ventas entre vendedores
promedio_global AS (
    SELECT 
        AVG(total_vendido) AS promedio_ventas
    FROM ventas_por_vendedor
)

-- Paso 3: Consulta final para filtrar los vendedores estrella
SELECT 
    v.seller_id,
    v.total_vendido,
    ROUND(p.promedio_ventas, 2) AS promedio_general_vendedores
FROM ventas_por_vendedor v
CROSS JOIN promedio_global p
WHERE v.total_vendido > p.promedio_ventas
ORDER BY v.total_vendido DESC
LIMIT 10;



ordenar cronoogicamente para identificar patrones de ventas y picos de demanda.
SELECT 
    customer_unique_id,
    order_id,
    order_purchase_timestamp AS fecha_compra,
    
    -- Asigna un número de compra consecutivo por cliente individual
    ROW_NUMBER() OVER(
        PARTITION BY customer_unique_id 
        ORDER BY order_purchase_timestamp ASC
    ) AS numero_de_compra_cliente

FROM olist_orders_dataset o
JOIN olist_customers_dataset c 
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
ORDER BY customer_unique_id, fecha_compra;
