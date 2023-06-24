CREATE TABLE orders(
  order_id int,
  customer_id int,
  menu_id int,
  branch_id int
);

INSERT into orders VALUES 
(1, 1, 1, 1),
(2, 1, 5, 1),
(3, 2, 3, 2),
(4, 3, 4, 2),
(5, 4, 2, 2),
(6, 5, 1, 3);

CREATE TABLE menus(
  menu_id int,
  menu_name text,
  price real
);

INSERT into menus values
(1, 'pizza', 300.00),
(2, 'spaghetti', 200.00),
(3, 'burgers', 150.00),
(4, 'hot dogs', 50.00),
(5, 'apple pie', 30.00);

CREATE TABLE customers (
  customer_id int,
  customer_name text,
  gender text 
);

INSERT into customers values 
(1, 'Haru', 'M'),
(2, 'Sakura', 'F'),
(3, 'Lucy', 'F'),
(4, 'Jimin', 'M'),
(5, 'Noah', 'M');

CREATE TABLE promotions (
  promotion_id int,
  promotion_name text,
  location text
);

INSERT into promotions values 
(1, 'discount', 'Bangkok'),
(2, 'flash sale', 'Pattaya'),
(3, 'voucher', 'Phuket');

CREATE TABLE branches (
  branch_id int,
  location text 
);

INSERT into branches values 
(1, 'Bangkok'),
(2, 'Pattaya'),
(3, 'Phuket');

.mode column
.header on

-- 3 query
SELECT 
  ord.order_id,
  ord.customer_id,
  cus.customer_name,
  count(*)
from orders AS ord
Join customers AS cus
on ord.customer_id = cus.customer_id
group by cus.customer_name
;

SELECT 
  ord.branch_id,
  pro.promotion_name,
  br.location,
  count(*)
from
promotions AS pro
Join branches AS br
on pro.location = br.location
Join orders AS ord
on br.branch_id = ord.branch_id
group by pro.promotion_name
;

SELECT 
  br.location,
  ord.order_id,
  me.menu_name,
  me.price,
  sum(price)
from branches AS br
Join orders AS ord
on br.branch_id = ord.branch_id
Join menus AS me 
on ord.menu_id = me.menu_id
group by me.price 
order by sum(price) desc
;

-- sub query
SELECT
  *
FROM (
SELECT 
  br.location,
  ord.order_id,
  me.menu_name,
  me.price,
  sum(price)
from branches AS br
Join orders AS ord
on br.branch_id = ord.branch_id
Join menus AS me 
on ord.menu_id = me.menu_id
group by me.price 
order by sum(price) desc) 
WHERE menu_name = 'pizza'
;

-- with 
WITH male AS(
SELECT 
  *
FROM customers
WHERE gender = 'M'
), male_order AS(
select
  *
from orders
), male_menu AS(
SELECT 
  *
from menus
)

SELECT * from male AS m
Join male_order AS m_ord
on m.customer_id = m_ord.customer_id
Join male_menu AS m_menu
on m_ord.menu_id = m_menu.menu_id
;
