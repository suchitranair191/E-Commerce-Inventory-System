Select customer_state,count(customer__id) from customer 
group by customer_state order by count(customer__id) DESC LIMIT 20;




SELECT  date(order_purchase_timestamp),count(order_id) AS NO_OF_Orders  FROM orders
where order_status='shipped' 
GROUP BY date(order_purchase_timestamp) 
order by count(order_id) DESC LIMIT 10;



INSERT INTO customer(customer__id, customer_unique_id, customer_zipcode_prefix , customer_city, customer_state)
VALUES ('1', '123', '14226','NYC','NY');

Select * from customer where customer__id='1'; 



Update customer
set customer_city = 'Seattle',customer_state='washington'
where customer__id='1';

Select * from customer where customer__id='1'; 



SELECT a.product_category_name AS product_CAT_Name, 
COUNT(b.product_category_name) AS quantity 
FROM products AS a
INNER JOIN products AS b 
ON a.product_category_name = b.product_category_name 
GROUP BY product_CAT_Name ORDER BY quantity  limit 5 ;



CREATE OR REPLACE FUNCTION rec_insert()
  RETURNS trigger AS
$$
BEGIN
         INSERT INTO sellers(seller_id,seller_zipcode_prefix,seller_city,seller_state)
         VALUES('vishnuk','14226','NYC','NY');
 
    RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';


CREATE TRIGGER ins_same_rec
  AFTER INSERT
ON sellers
FOR EACH ROW
EXECUTE PROCEDURE rec_insert();