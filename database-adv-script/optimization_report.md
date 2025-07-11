# Optimization Report

<<<<<<< HEAD
## Original Query Description

The original SQL query joins four tables: `bookings`, `users`, `properties`, and `payments`. It retrieves detailed booking information, including user name, property name, and payment amount.

```sql
SELECT
    b.id AS booking_id,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id;
=======
## Initial Query
The query joins the `bookings`, `users`, `properties`, and `payments` tables to retrieve relevant data.

## Performance Issues
- Full table scans due to no indexes on join keys.
- Multiple joins increasing complexity.

## Optimization Strategy
- Added indexes on `user_id`, `property_id`, and `booking_id`.
- Analyzed query using `EXPLAIN ANALYZE`.

## Result
Execution time decreased. Join efficiency improved by relying on indexed columns.
>>>>>>> 6949e2e (Add performance optimization query and report)
