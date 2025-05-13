Bottlenecks

1.  type = ALL ---> Full table scan
    fix --> use indexes like user_id, property_id, booking_id
2.  key = NULL ---> no index used,
    fix --> ensure indexing of foreign key columns
3.  scanning many rows --> use filtering with WHERE clause & LIMIT

4.  partitions column: confirms partition pruning.

5.  rows: should be significantly fewer than a full table scan.

6.  type: should be range or better (not ALL).

7.  key: shows whether indexes are used.
