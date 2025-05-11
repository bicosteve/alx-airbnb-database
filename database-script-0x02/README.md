INSERT INTO
User (
user_id,
first_name,
last_name,
email,
password_hash,
phone_number,
role
)
VALUES
(
'3331e10c-3bd4-49a2-b44b-08b3e1cf2f95',
'Mary',
'Jane',
'mary.jane@gmail.com',
'$2y$10$UxMFyUyxFtFBhOOWNvX6H.EjVfaXIBMI1Yty3cwU7P/ZlxM5ybidm',
'123-456-7890',
'guest'
);

INSERT INTO
Property (
property_id,
host_id,
name,
description,
location,
pricepernight
)
VALUES
(
'fc67d31e-f123-45de-8cda-406450fc076f',
'3331e10c-3bd4-49a2-b44b-08b3e1cf2f95',
'Cozy Apartment',
'A beautiful and well-equipped apartment in the heart of the city.',
'Nairobi, Kenya',
4500.00
);

INSERT INTO
Booking (
booking_id,
property_id,
user_id,
start_date,
end_date,
total_price,
status
)
VALUES
(
'6887de20-406c-42f5-a1b1-a3b50079c1c8',
'fc67d31e-f123-45de-8cda-406450fc076f',
'3331e10c-3bd4-49a2-b44b-08b3e1cf2f95',
'2025-05-10',
'2025-05-15',
4500.00,
'pending'
);

INSERT INTO
Payment (
payment_id,
booking_id,
amount,
payment_method
)
VALUES
(
'6a86fa0d-bdbd-4b52-b3e2-885182f2fc08',
'6887de20-406c-42f5-a1b1-a3b50079c1c8',
4500.00,
'credit_card'
);

INSERT INTO
Review (
review_id,
property_id,
user_id,
rating,
comment
)
VALUES
(
'f5784281-f4e6-461d-8389-36dc7be5bcd7',
'3331e10c-3bd4-49a2-b44b-08b3e1cf2f95',
'd99d5e58-c3b8-4d4e-8674-c0e0d2977df6',
5,
'Great place to stay!'
);

INSERT INTO
Message (
message_id,
sender_id,
recipient_id,
message_body
)
VALUES
(
'ce6280a7-0e19-4b17-8acc-906b8b052260',
'f739dd7e-98aa-41f1-a18c-5268e1593e7e',
'f1f0e1ba-6a27-435c-841e-de408f30b759',
'Hello, how are you?'
);
