CREATE TABLE IF NOT EXISTS public.customer
(
    customer__id character varying(100) COLLATE pg_catalog."default",
    customer_unique_id character varying(100) COLLATE pg_catalog."default",
    customer_zipcode_prefix character varying(100) COLLATE pg_catalog."default",
    customer_city character varying(100) COLLATE pg_catalog."default",
    customer_state character varying(100) COLLATE pg_catalog."default"
)

CREATE TABLE IF NOT EXISTS public.customer_address_data
(
    customer_zip_code_prefix character varying(100) COLLATE pg_catalog."default",
    customer_city character varying(100) COLLATE pg_catalog."default",
    customer_state character varying(100) COLLATE pg_catalog."default"
)

CREATE TABLE IF NOT EXISTS public.customers_data
(
    customer_id character varying(100) COLLATE pg_catalog."default",
    customer_unique_id character varying(100) COLLATE pg_catalog."default",
    cuistomer_zip_code_prefix character varying(100) COLLATE pg_catalog."default"
)

CREATE TABLE IF NOT EXISTS public.order_items
(
    order__id character varying(100) COLLATE pg_catalog."default",
    order_item_id character varying(100) COLLATE pg_catalog."default",
    product_id character varying(100) COLLATE pg_catalog."default",
    seller_id character varying(100) COLLATE pg_catalog."default",
    shipping_limit_data character varying(100) COLLATE pg_catalog."default",
    price character varying(100) COLLATE pg_catalog."default",
    freight_value character varying(100) COLLATE pg_catalog."default"
)


CREATE TABLE IF NOT EXISTS public.order_pays
(
    product_id character varying(1000) COLLATE pg_catalog."default",
    payment_sequential character varying(1000) COLLATE pg_catalog."default",
    payment_type character varying(1000) COLLATE pg_catalog."default",
    payment_installments character varying(1000) COLLATE pg_catalog."default",
    payment_value character varying(1000) COLLATE pg_catalog."default"
)

CREATE TABLE IF NOT EXISTS public.orders
(
    order_id character varying(100) COLLATE pg_catalog."default",
    customer_id character varying(100) COLLATE pg_catalog."default",
    order_status character varying(100) COLLATE pg_catalog."default",
    order_purchase_timestamp character varying(100) COLLATE pg_catalog."default",
    order_approved_at character varying(100) COLLATE pg_catalog."default",
    order_delivered_carrier_date character varying(100) COLLATE pg_catalog."default",
    order_delivered_customer_date character varying(100) COLLATE pg_catalog."default",
    order_estimated_delivery_date character varying(100) COLLATE pg_catalog."default"
)

CREATE TABLE IF NOT EXISTS public.products
(
    product_id character varying(100) COLLATE pg_catalog."default",
    product_category_name character varying(100) COLLATE pg_catalog."default",
    product_name_length character varying(100) COLLATE pg_catalog."default",
    product_description_lenght character varying(100) COLLATE pg_catalog."default",
    product_photos_qty character varying(100) COLLATE pg_catalog."default",
    product_weight_g character varying(100) COLLATE pg_catalog."default",
    product_length_cm character varying(100) COLLATE pg_catalog."default",
    product_height_cm character varying(100) COLLATE pg_catalog."default",
    product_width_cm character varying(100) COLLATE pg_catalog."default"
)

CREATE TABLE IF NOT EXISTS public.sellers
(
    seller_id character varying(100) COLLATE pg_catalog."default",
    seller_zip_code_prefix character varying(100) COLLATE pg_catalog."default",
    seller_city character varying(100) COLLATE pg_catalog."default",
    seller_state character varying(100) COLLATE pg_catalog."default"
)
