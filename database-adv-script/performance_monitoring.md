-- Step 1: Enable profiling
SET profiling = 1;

-- Step 2: Run your query
SELECT
booking_id,
property_id,
user_id,
FROM Booking
WHERE start_date BETWEEN '2025-05-01' AND '2025-05-31'
AND status = 'confirmed';

-- Step 3: Show profiling results
SHOW PROFILES;

-- Step 4: Get detailed breakdown for the last query
SHOW PROFILE FOR QUERY "708c4063-673e-48fb-81f0-07bdd83013e6";

Suggested Changes
-- Add an index to support filtering
CREATE INDEX idx_booking_start_status ON Booking(start_date, status);

Observed improvements
idx_booking_start_status has significantly improved the performance of the query as it is now faster.
