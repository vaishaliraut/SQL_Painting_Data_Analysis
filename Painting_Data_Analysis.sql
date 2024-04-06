-- use database 
use painting;
-- use painting;

-- show tables
show tables;

-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.

select a.full_name as artist_name,c.name as museum_name
from artist a
inner join work b on a.artist_id = b.artist_id
inner join museum c on b.museum_id = c.museum_id;



-- 2. Group By and Count:
-- How many works does each artist have in the database? Display the artist's full name along with the count of their works, ordered by the count in descending order.

select a.full_name, count(b.work_id) as count_of_paintings
from artist a
inner join work b on a.artist_id = b.artist_id
group by a.full_name
order by count_of_paintings desc;

-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.

select a.name as museum_name, count(b.work_id) as count_of_paintings
FROM  museum a
inner join work b ON a.museum_id = b.museum_id
group by museum_name 
order by count_of_paintings desc limit 5;



-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. Limit the results to 10.

select a.name as painting_name, a.style, b.name as museum_name
from work a
inner join museum b on a.museum_id = b.museum_id
order by museum_name limit 10;



-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.

select a.full_name as artist_name, sum(c.sale_price) as total_sale_price
from artist a
inner join work b on a.artist_id = b.artist_id
inner join product_size c on b.work_id = c.work_id
group by artist_name
order by total_sale_price desc;



-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.

select a.full_name as artist_name, count(b.work_id) as count_of_work
from artist a
inner join work b on a.artist_id = b.artist_id
group by artist_name
having count_of_work >3
order by count_of_work;



-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 

select b.full_name as artist_name,a.name as painting_name
from work a
inner join artist b on a.artist_id = b.artist_id
inner join product_size c on c.work_id = a.work_id
where c.sale_price < c.regular_price
order by artist_name;




-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width.

select a.name as painting_name, avg(c.height) as avg_height,avg(c.width) as avg_width
from work a
inner join product_size b on a.work_id = b.work_id
inner join canvas_size c on c.size_id = b.size_id
group by painting_name;





-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.

select a.name as painting_name, max(b.sale_price) as max_price
from work a
inner join product_size b on a.work_id = b.work_id
group by painting_name
order by max_price desc;




-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.

select concat(a.first_name,' ',a.last_name,',',a.nationality) as Name_with_Nationality, 
count(b.work_id) as count_of_painting
from artist a
inner join work b on a.artist_id = b.artist_id
group by Name_with_Nationality
order by count_of_painting desc;



