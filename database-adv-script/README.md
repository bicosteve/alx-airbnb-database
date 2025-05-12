-- 1. Write a query usin INNER JOIN to retrieve all bookings and respective users who made the booking
SELECT \* FROM Booking INNER JOIN User WHERE User.user_id = Booking.user_id;
