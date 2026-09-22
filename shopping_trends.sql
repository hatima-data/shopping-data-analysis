create table shopping_trends (
		customer_id int,
		age int,
		gender varchar(50),
		item_purchosed varchar,
		category varchar,
		purchase_amount_usd numeric,
		location varchar,
		sizes varchar,
		color varchar,
		season varchar,
		review_rating varchar,
		subscrition_status varchar,
		payment_method varchar,
		shipping_type varchar,
		discount_applied; varchar,
		promo_code_used varchar,
		previous_purchases int,
		preffered_payment_method varchar,
		frequency_of_purchases varchar
);
select*from shopping_trends;

alter table shopping_trends
drop column subscrition_status,
drop column promo_code_used,
drop column discount_applied;

select 
	count(age) as count_age
	from shopping_trends
	group by age
	order by count(age) asc;
	
select 
	category,
	count(category) as count_category
	from shopping_trends
	group by category;

select 
	gender,
	count(*) as count_gander
	from shopping_trends
	group by gender;

select 
	payment_method,
	count (*) as count_pay_method
	from shopping_trends
	group by payment_method
	order by count_pay_method desc;

select 
	category,
	sum(purchase_amount_usd) 
	from shopping_trends
	group by category
	order by sum(purchase_amount_usd) desc;
	
select
	location,
	count(*) count_location
	from shopping_trends
	group by location
	order by count_location desc;

select 
	location,
	avg(age) as avg_age
	from shopping_trends
	group by location
	order by avg_age desc;

select
	item_purchosed,
	count(*) as count_item_purch
	from shopping_trends
	group by item_purchosed
	order by count_item_purch desc;

select
	season,
	count(*) as count_season
	from shopping_trends
	group by season
	order by count_season desc;

select 
	shipping_type,
	count(*) as count_shipping_type
	from shopping_trends
	group by shipping_type
	order by count_shipping_type;

select 
	age,
	sum(purchase_amount_usd)
	from shopping_trends
	group by age
	order  by sum(purchase_amount_usd) desc;

select 
	customer_id,
	age,
	gender,
	item_purchosed,
	category,
	purchase_amount_usd,
	location,
	sizes,
	color,
	payment_method
	from shopping_trends
	where purchase_amount_usd=(select max(purchase_amount_usd) from shopping_trends);


select 
	customer_id,
	age,
	gender,
	item_purchosed,
	category,
	purchase_amount_usd,
	location,
	sizes,
	color
	from shopping_trends
	where purchase_amount_usd=(select min(purchase_amount_usd) from shopping_trends);

select
	category,
	max(purchase_amount_usd)
	from shopping_trends
	group by category;
	
select
	category,
	sum(purchase_amount_usd) as total_amount
	from shopping_trends
	group by category
	having sum(purchase_amount_usd)>20000;
	
select 
	customer_id,
	item_purchosed,
	purchase_amount_usd
	from shopping_trends
	where purchase_amount_usd>(select avg(purchase_amount_usd) from shopping_trends);
	
select customer_id, purchase_amount_usd,
	case
		when purchase_amount_usd>70 then 'Expensive'
		else 'Cheap'
	end as price_category
	from shopping_trends;

select 
	item_purchosed,
	gender,
	count(*) as total_count
	from shopping_trends
	group by item_purchosed, gender
	order by total_count;

select 
	item_purchosed,
	customer_id,
	purchase_amount_usd
	from shopping_trends
	where item_purchosed like 'S%';
	
select 
	customer_id,
	age,
	item_purchosed,
	purchase_amount_usd
	from shopping_trends
	where age between 25 and 40;

select 
	customer_id,
	category,
	item_purchosed,
	purchase_amount_usd
	from shopping_trends
	where category in ('Clothing', 'Footwear');


select
	season,
	item_purchosed,
	min(purchase_amount_usd)
	from shopping_trends
	group by season,item_purchosed
	order by min(purchase_amount_usd)
	limit 10;
	
	
select 
	category,
	count(*)as total_items
	from shopping_trends
	group by category
	having count(*)>50;

select 
	customer_id,
	item_purchosed,
	purchase_amount_usd
	from shopping_trends
	order by purchase_amount_usd asc limit 5;


select 
	customer_id,
	item_purchosed,
	purchase_amount_usd
	from shopping_trends
	where gender='Female' and purchase_amount_usd>80;

select
	customer_id,
	item_purchosed,
	purchase_amount_usd
	from shopping_trends
	where gender='Male' and purchase_amount_usd>(select avg(purchase_amount_usd) from shopping_trends);

select 
	location,
	count(*) as customer_count
	from shopping_trends
	group by location
	order by customer_count desc;

select 
	category,
	max(purchase_amount_usd) as max_purchase
	from shopping_trends
	group by category
	order by max_purchase desc;
	
select
	customer_id,
	item_purchosed,
	purchase_amount_usd
	from shopping_trends
	order by purchase_amount_usd desc
	limit 1
	offset 1;
	
select
	count(*) as footwear_count
	from shopping_trends
	where category='Footwear';

select 
	customer_id,
	item_purchosed,
	purchase_amount_usd,
	row_number() over(partition by customer_id order by purchase_amount_usd)
	from shopping_trends;
	
select
	customer_id,
	purchase_amount_usd,
	lag(purchase_amount_usd) over(partition by customer_id order by customer_id) as previous_purchase
	from shopping_trends;







	