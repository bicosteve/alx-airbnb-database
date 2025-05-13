-- 1. Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT
    *
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

-- 2. Write a correlated subquery to find users who have made more than 3 bookings.
SELECT
    *
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
            COUNT(*) > 3
    );