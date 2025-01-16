#11. Calculate the percentage contribution of each pizza type to total revenue
Select c.category, round(sum(d.quantity*p.price) /
(Select round(sum(d.quantity*p.price),2) as Total_Sales
from order_details d join pizzas p 
on p.pizza_id = d.pizza_id) *100,2) as Revenue
from pizza_types c join pizzas p 
on c.pizza_type_id=p.pizza_type_id
join order_details d on
d.pizza_id = p.pizza_id
group by c.category order by Revenue desc;


#12. Determine the top 3 most ordered pizza types based on revenue for each pizza category
Select name, revenue from
(Select category, name, revenue,
rank() over(partition by category order by revenue desc) as rn from
(Select c.name, c.category, sum((d.quantity) * p.price) as revenue
from order_details d join pizzas p
on d.pizza_id = p.pizza_id
join pizza_types c
on c.pizza_type_id = p.pizza_type_id
group by c.name, c.category) as a) as b
where rn<=3;