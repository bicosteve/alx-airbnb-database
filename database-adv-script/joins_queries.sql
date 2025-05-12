-- 1. Write a query usin INNER JOIN to retrieve all bookings and respective users who made the booking
SELECT
    *
FROM
    Booking
    INNER JOIN User ON User.user_id = Booking.user_id;

-- 2. Write query using LEFT JOIN to retrieve all properties and their reviews including properties with no Reviews
SELECT
    Property.property_id,
    Property.host_id,
    Property.name,
    Property.description,
    Property.location,
    Property.pricepernight,
    Property.created_at,
    Property.updated_at,
    Review.review_id,
    Review.property_id,
    Review.user_id,
    Review.rating
FROM
    Property
    LEFT JOIN Review ON Property.property_id = Review.property_id;

-- 3. Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT
    *
FROM
    User FULL
    OUTER JOIN Booking ON User.user_id = Booking.user_id;