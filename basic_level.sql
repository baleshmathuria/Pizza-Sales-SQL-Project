select * from pizzahut.pizzas
-- Retrieve the total number of orders placed.

select  COUNT(distinct order_id) from order_details;

-- --Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS Total_Revenue
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;

-- Identify the highest-priced pizza.

select  pizza_types.name , pizzas.price
from pizza_types join pizzas
on pizzas.pizza_type_id = pizza_types.pizza_type_id 
order by pizzas.price desc limit 1;

-- Identify the most common pizza size ordered.


select pizzas.size , sum(order_details.quantity) as total_ordered
from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizzas.size order by total_ordered desc limit 1 ;

-- List the top 5 most ordered pizza types along with their quantities.

select pizza_types.name ,  sum(order_details.quantity) as total_ordered
from pizza_types join pizzas on
pizza_types.pizza_type_id = pizzas.pizza_type_id 
join order_details on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.name
order by total_ordered desc limit 5 ;

-- Intermediate level
-- Join the necessary tables to find the total quantity of each pizza category ordered.

select pizza_types.category , sum(order_details.quantity) as quantity
from pizza_types join pizzas on  pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.category
order by quantity desc ;


