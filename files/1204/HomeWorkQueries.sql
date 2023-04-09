select c.store_id, CONCAT(s.first_name, ' ', s.last_name) as 'Staff Name', 
c2.city as 'Store location', count(c.store_id) as Active_Customers
from customer c
right join store s2 on s2.store_id = c.store_id
right join address a on a.address_id = s2.store_id
right join city c2 on c2.city_id = a.city_id 
right join staff s on s.staff_id  = s2.manager_staff_id 
where c.active <> '0'
group by store_id having Active_Customers > 300;

select count(film_id) as 'film count' from film f
where length > (select avg(length) from film);

select year(payment_date) as Year, monthname(payment_date) as Month, 
sum(amount) as Amount, count(customer_id) as 'Rental count'
from payment p 
group by year(payment_date), monthname(payment_date)
order by Amount desc limit 1;

select p.staff_id as Staff_ID, concat(s.first_name, ' ', s.last_name)  as Name, count(p.rental_id) as Orders
from payment p  
right join staff s on s.staff_id  = p.staff_id  
group by p.staff_id, s.staff_id  

select p.staff_id as Staff_ID, concat(s.first_name, ' ', s.last_name)  as Name, count(p.rental_id) as Orders,
case
	when count(rental_id) > 8000 then 'yes'
	else 'no'
end as 'Should we pay Bonus'
from payment p  
right join staff s on s.staff_id  = p.staff_id  
group by p.staff_id, s.staff_id; 

select s.store_id, f.title, r.rental_date  
from film f 
left join inventory i on i.film_id = f.film_id 
left join rental r on r.inventory_id = i.inventory_id
left join store s on s.store_id = i.store_id 
where i.inventory_id is not NULL and r.rental_date is NULL
-- where  r.rental_date is NULL

SELECT f.title
FROM film f
LEFT JOIN inventory i ON i.film_id = f.film_id
LEFT JOIN rental r ON r.inventory_id = i.inventory_id
WHERE r.rental_id IS NULL;

select DISTINCT(film_id)
from inventory i 
