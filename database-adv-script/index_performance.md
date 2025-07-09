# Index Performance Report

## Before Indexing

Query: `SELECT * FROM bookings WHERE user_id = 1`
- Type: ALL
- Rows examined: 5000+
- Time: ~0.45 sec

## After Indexing

Query: `SELECT * FROM bookings WHERE user_id = 1`
- Type: ref
- Rows examined: 3
- Time: ~0.01 sec

## Observations

By indexing `user_id`, `property_id`, `email`, and `created_at`, queries became significantly faster, reducing full table scans to indexed lookups.