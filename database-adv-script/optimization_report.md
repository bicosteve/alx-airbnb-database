Bottlenecks

1.  type = ALL ---> Full table scan
    fix --> use indexes like user_id, property_id, booking_id
2.  key = NULL ---> no index used,
    fix --> ensure indexing of foreign key columns
3.  scanning many rows --> use filtering with WHERE clause & LIMIT
