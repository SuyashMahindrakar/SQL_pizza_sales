#6. Join the necessary tables to find the total quantity of each pizza category ordered

Select c.category, sum(o.quantity) as TotalQuantity
from pizza_types c join pizzas z
on c.pizza_type_id = z.pizza_type_id
join order_details o 
on o.pizza_id = z.pizza_id
group by c.category order by sum(o.quantity);

#7. Determine the distribution of orders by hour of the day
SELECT 
    COUNT(ORDER_ID) AS ORDER_COUNT, HOUR(ORDER_TIME) AS HOUR
FROM
    ORDERS
GROUP BY HOUR(ORDER_TIME);


#8. Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;


#9. Group the orders by date and calculate the average number of pizzas ordered per day
Select round(avg(quantity),0) as avg_perday from (Select o.order_date, sum(d.quantity) as quantity
from orders o join order_details d 
on o.order_id = d.order_id
group by o.order_date) as order_quantity;


#10. Determine the top 3 most ordered pizza types based on revenue.
Select c.name, sum(d.quantity * p.price) as Revenue
from pizza_types c join pizzas p
on p.pizza_type_id = c.pizza_type_id
join order_details d
on d.pizza_id = p.pizza_id
group by c.name 
order by Revenue desc limit 3; 

