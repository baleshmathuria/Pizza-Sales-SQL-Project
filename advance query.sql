-- Calculate the percentage contribution of each pizza type to total revenue.



select pizza_types.category , concat (round(sum(order_details.quantity * pizzas.price) / (select sum(order_details.quantity * pizzas.price) from order_details
join pizzas on order_details.pizza_id = pizzas.pizza_id )* 100 ,2), '%') as revenue
from pizza_types join pizzas on 
pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category 
order by revenue desc 

-- Analyze the cumulative revenue generated over time.

