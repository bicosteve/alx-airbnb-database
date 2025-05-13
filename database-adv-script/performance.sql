-- 1. Write an initial query that retrieves all bookings along with the user details, property details, and payment details
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at AS booking_created_at,
    u.user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.status AS payment_status,
    pay.payment_date AS date_of_payment
FROM
    Booking b
    JOIN User u ON b.user_id = u.user_id
    JOIN Property p ON b.property_id = p.property_id
    LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- 2. Analyze the query’s performance using EXPLAIN and identify any inefficiencies
EXPLAIN
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at AS booking_created_at,
    u.user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date AS date_of_payment
FROM
    Booking b
    JOIN User u ON b.user_id = u.user_id
    JOIN Property p ON b.property_id = p.property_id
    LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- 3. Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.name AS user_name,
    u.email AS user_email,
    p.name AS property_name,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date AS payment_date
FROM
    Booking b
    JOIN User u ON b.user_id = u.user_id
    JOIN Property p ON b.property_id = p.property_id
    LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE
    b.created_at >= CURRENT_DATE - INTERVAL 30 DAY
LIMIT
    100;