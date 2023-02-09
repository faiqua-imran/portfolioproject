SET @userinput1 :='PG';

Select
    sakila.film.film_id, sakila.film.title,sakila.film.rating,sum(sakila.payment.amount) revenue,count(inventory.film_id) AS frequency
From
    sakila.film Inner Join
    sakila.inventory On sakila.inventory.film_id = sakila.film.film_id Inner Join
    sakila.rental On sakila.rental.inventory_id = sakila.inventory.inventory_id Inner Join
    sakila.payment On sakila.payment.rental_id = sakila.rental.rental_id
    
    where sakila.film.rating = @userinput1
 group by  sakila.film.film_id
    order by revenue Desc
    limit 5;
    
    #FREQUENCY BASIS
    
    SET @userinput1 :='PG';

Select
    sakila.film.film_id, sakila.film.title,sakila.film.rating,sum(sakila.payment.amount) revenue,count(inventory.film_id) AS frequency
From
    sakila.film Inner Join
    sakila.inventory On sakila.inventory.film_id = sakila.film.film_id Inner Join
    sakila.rental On sakila.rental.inventory_id = sakila.inventory.inventory_id Inner Join
    sakila.payment On sakila.payment.rental_id = sakila.rental.rental_id
    
    where sakila.film.rating = @userinput1
 group by  sakila.film.film_id
    order by frequency Desc
    limit 5;