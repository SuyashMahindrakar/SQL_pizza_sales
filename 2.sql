-- 1. Retrieve the total number of orders placed
SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;

-- 2. Calculate the total revenue generated from pizza sales.
SELECT 
    ROUND(SUM(a.quantity * b.price),2) AS total_revenue
FROM
    order_details a
        JOIN
    pizzas b ON a.pizza_id = b.pizza_id;
    
    
-- 3. Identify the highest-priced pizza
   SELECT c.name, b.price FROM pizza_types c 
   JOIN pizzas b ON c.pizza_type_id = b.pizza_type_id
   ORDER BY b.price DESC LIMIT 1;
   
   
-- 4. Identify the most common pizza size ordered
   SELECT 
    quantity, COUNT(order_details_id)
FROM
    order_details
GROUP BY quantity;
   
   
#5.  List the top 5 most ordered pizza types along with their quantities
SELECT 
    c.name, SUM(o.quantity)
FROM
    pizza_types c
        JOIN
    pizzas z ON c.pizza_type_id = z.pizza_type_id
        JOIN
    order_details o ON o.pizza_id = z.pizza_id
GROUP BY c.name
ORDER BY SUM(o.quantity) DESC
LIMIT 5;