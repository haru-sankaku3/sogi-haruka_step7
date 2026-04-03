--設問１
Select * 
from users;

--設問2
Select * 
from users
where created_at 
like '2024%';

--設問3
Select * 
from users
where age<30 
and gender='female';

--設問4
Select product_name,price
from products;

--設問5
Select users.name,orders.order_date
from users
join orders 
on users.id=orders.users_id;

--設問6
Select products.product_name,order_items.quantity,products.price,(products.price*order_items.quantity) as total_price
from products
join order_items
on products.id=order_items.product_id;

--設問7
Select users.name,count(orders.id) as order_count
from users
left join orders on users.id = orders.users_id
group by users.id;

--設問8
Select users.name,sum(products.price*order_items.quantity) as total_amount
from users
join orders on users.id=orders.users_id
join order_items on orders.id=order_items.order_id
join products on order_items.product_id=products.id
group by users.id;

--設問9
Select users.name,sum(products.price*order_items.quantity) as total_amount
from users
join orders on users.id=orders.users_id
join order_items on orders.id=order_items.order_id
join products on order_items.product_id=products.id
group by users.id
order by total_amount desc
limit 1;

--設問10
Select products.product_name,sum(order_items.quantity) as total_sold_quantity
from products
join order_items on products.id = order_items.product_id
group by products.id;

--設問11
Select users.name
from users
left join orders on users.id = orders.users_id
where orders.id is null;

--設問12
Select order_id
from order_items
group by order_id
having count(product_id) >= 2;

--設問13
Select users.name
from users
join orders on users.id=orders.users_id
join order_items on orders.id=order_items.order_id
join products on order_items.product_id=products.id
where products.product_name='テレビ';

--設問14
select 
    orders.order_date,
    users.name as user_name,
    products.product_name,
    order_items.quantity,
    (products.price*order_items.quantity) as total_amount
from order_items
join orders on order_items.order_id=orders.id
join users on orders.users_id=users.id
join products on order_items.product_id=products.id;

--設問15
select products.product_name
from products
join order_items on order_items.product_id=products.id
group by products.id
order by sum(order_items.quantity) desc
limit 1;

--設問16
select left(order_date,7) as month, count(id) as order_count
from orders
group by month
order by month asc;

--設問17
select products.product_name
from products
left join order_items on order_items.product_id=products.id
where order_items.id is null;

--設問18
create index idx_product_id on order_items(product_id);

--設問19
select users_name, avg(order_total) as avg_amount
from (
    select 
        users.name as users_name,
        orders.id as order_id,
        sum(products.price*order_items.quantity) as order_total
    from users
    join orders on users.id=orders.users_id
    join order_items on orders.id=order_items.order_id
    join products on order_items.product_id=products.id
    group by orders.id
) as order_summaries
group by users_name;

--設問20
select users.name, max(orders.order_date) as last_order_date
from users
join orders on users.id=orders.users_id
group by users.id
order by last_order_date desc;

--設問21
insert into users (id,name,age,gender,created_at)
values (6,'中村愛',25,'female','2025-06-01');

--設問22
insert into products (id,product_name,price)
values (6,'エアコン',50000);

--設問23
insert into orders (id,users_id,order_date)
values (10,1,'2025-06-10');

--設問24
insert into order_items (id,order_id,product_id,quantity)
values (10,10,6,1);

--設問25
update users
set age=24
where id=4;

--設問26
update products
set price=price*1.1;

--設問27
update orders
set order_date='2024-05-01'
where order_date <= '2024-05-31';

--設問28
delete
from users
where name='高橋健一';

--設問29
delete
from order_items
where order_id=5;

--設問30
delete products
from products
left join order_items on order_items.product_id=products.id
where order_items.id is null;