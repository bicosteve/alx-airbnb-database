-- 1. Assume the Booking table is large and query performance is slow. Implement partitioning on the Booking table based on the start_date column.
CREATE TABLE Booking (
    booking_id UUID NOT NULL,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date),
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
) PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2025
    VALUES
        LESS THAN (2026),
        PARTITION p2026
    VALUES
        LESS THAN (2027),
        PARTITION p2028
    VALUES
        LESS THAN (2028),
        PARTITION pmax
    VALUES
        LESS THAN MAXVALUE
);

-- 2. Analyze the query’s performance using EXPLAIN and identify any inefficiencies
EXPLAIN
SELECT
    *
FROM
    Booking
WHERE
    start_date BETWEEN '2025-04-05'
    AND '2025-05-10';