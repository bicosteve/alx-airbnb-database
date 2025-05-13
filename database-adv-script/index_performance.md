CREATE INDEX idx_user_id ON `User`(`user_id`, `email`);

CREATE INDEX idx_property_id ON `Property`(`property_id`, `created_at`);

CREATE INDEX idx_booking_id ON `Booking`(`booking_id`, `created_at`);

CREATE INDEX idx_payment_id ON `Payment`(`payment_id`, `payment_date`);

CREATE INDEX idx_review_id ON `Review`(`review_id`, `rating`);

CREATE INDEX idx_message_id ON `Message`(`message_id`, `sent_at`);

-- PERFORMANCE
-- EXPLAIN
EXPLAIN
SELECT \*
FROM
User
WHERE
user_id = 'b03aefe1-9ef6-444e-8429-e8f26efc47a0';

EXPLAIN
SELECT \*
FROM
Property
WHERE
property_id = 'b03aefe1-9ef6-444e-8429-e8f26efc47a0';

-- EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT \*
FROM
Booking
WHERE
booking_id = '86e4b17b-ce4b-4b8d-96f9-24b7cd8d350f';
