-- 1. Write a query usin INNER JOIN to retrieve all bookings and respective users who made the booking
SELECT \*
FROM
Booking
INNER JOIN User ON User.user_id = Booking.user_id;

-- 2. Write query using LEFT JOIN to retrieve all properties and their reviews including properties with no Reviews
SELECT \*
FROM
Property
LEFT JOIN Review ON Property.property_id = Review.property_id;

-- 3. Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT \*
FROM
User FULL
OUTER JOIN Booking ON User.user_id = Booking.user_id;

-- 4. Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT \*
FROM
Property
WHERE
property_id IN (
SELECT
property_id
FROM
Review
WHERE
rating > 4.0
);

-- 5. Write a correlated subquery to find users who have made more than 3 bookings.
SELECT
_
FROM
User
WHERE
user_id IN (
SELECT
user_id
FROM
Booking
GROUP BY
user_id
HAVING
COUNT(_) > 3
);
