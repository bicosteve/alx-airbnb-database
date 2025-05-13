Queries that filter by start_date (or a date range) will only scan relevant partitions, reducing I/O.

This is especially useful for time-series data like bookings
