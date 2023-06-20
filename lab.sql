-- 1) List each pair of actors that have worked together.
select f1.actor_id,f2.actor_id,f1.film_id from film_actor f1
join film_actor f2 on f1.actor_id != f2.actor_id and
f1.film_id = f2.film_id
where f1.actor_id < f2.actor_id;

-- 2) For each film, list actor that has acted in more films.
with cte_filmactor as (
  select actor_id,count(film_id) as film_count
  from film_actor
  group by actor_id
)
select f.film_id, f.actor_id, c.film_count from film_actor f
left join cte_filmactor c on f.actor_id = c.actor_id
having c.film_count > 1;