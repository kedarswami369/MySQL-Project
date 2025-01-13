create database Tourist;
use tourist;
show tables;
alter table tourist_places add primary key (place_id);
alter table visitors add primary key (visitor_Id);
desc tourist_places;
desc visitors;
alter table bookings add constraint fk1 foreign key(visitor_id) references visitors(visitor_id);
alter table reviews add constraint fk2 foreign key(visitor_id) references visitors(visitor_id);
alter table bookings add constraint fk3 foreign key(place_id) references tourist_places(place_id);
alter table events add constraint fk4 foreign key(place_id) references tourist_places(place_id);
alter table accommodation add constraint fk5 foreign key(place_id) references tourist_places(place_id);
alter table transportation add constraint fk6 foreign key(place_id) references tourist_places(place_id);
alter table reviews add constraint fk7 foreign key(place_id) references tourist_places(place_id);
select * from Tourist_places;


-- 1. Find the top 5 hotels with the highest rating in a specific place.
SELECT hotel_name, rating, price_per_night 
FROM Accommodation 
WHERE place_id = 1 
ORDER BY rating DESC 
LIMIT 5;

-- 2. List all the places where a specific event is happening.
SELECT place_name 
FROM Tourist_places
WHERE place_id IN (SELECT place_id FROM Events WHERE event_name = 'Mandatory hybrid protocol');

-- 3. Find the average rating of a specific place.
SELECT AVG(rating) AS avg_rating 
FROM Reviews 
WHERE place_id = 1;

-- 4. Find the total number of visitors who booked accommodations for a specific event.
SELECT SUM(number_of_visitors) AS total_visitors 
FROM Bookings 
WHERE place_id = (SELECT place_id FROM Events WHERE event_name = 'Mandatory hybrid protocol');

-- 5. List all visitors who have given reviews for a specific place.
SELECT DISTINCT V.name 
FROM Visitors V 
JOIN Reviews R ON V.visitor_id = R.visitor_id 
WHERE R.place_id = 1;

-- 6. Get the details of the top 3 most expensive accommodations.
SELECT hotel_name, price_per_night 
FROM Accommodation 
ORDER BY price_per_night DESC 
LIMIT 3;

-- 7.. Find the transportation types available at a specific place.
SELECT transport_type 
FROM Transportation 
WHERE place_id = 1;

-- 8.Get the total number of bookings for a place.
SELECT COUNT(*) AS total_bookings 
FROM Bookings 
WHERE place_id = 5;

-- 9. Get the list of places with fee is grater than 100.
SELECT place_name 
FROM Tourist_places
WHERE entry_fee >=100;

-- 10.Find all visitors who stayed in accommodations with a rating above 4
SELECT DISTINCT V.name 
FROM Visitors V 
JOIN Bookings B ON V.visitor_id = B.visitor_id 
JOIN Accommodation A ON B.place_id = A.place_id 
WHERE A.rating > 4;

-- 11.Find the most expensive transportation for a place.
SELECT transport_type, cost 
FROM Transportation 
WHERE place_id = 1 
ORDER BY cost DESC 
LIMIT 1;

-- 12.Get the places open during a specific season.
SELECT place_name 
FROM Tourist_places
WHERE best_season = 'Winter';

-- 13. Find visitors who have booked accommodations for more than 2 visitors.
SELECT DISTINCT V.name 
FROM Visitors V 
JOIN Bookings B ON V.visitor_id = B.visitor_id 
WHERE B.number_of_visitors > 2;

-- 14.List all reviews for a place, ordered by rating.
SELECT R.review_text, R.rating, V.name 
FROM Reviews R 
JOIN Visitors V ON R.visitor_id = V.visitor_id 
WHERE R.place_id = 1 
ORDER BY R.rating DESC;

-- 15.List the names of places along with their average ratings.
SELECT place_name, AVG(rating) AS avg_rating 
FROM Tourist_places
JOIN Reviews R ON Tourist_places.place_id = R.place_id 
GROUP BY Tourist_places.place_id;














