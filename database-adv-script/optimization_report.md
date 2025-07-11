# Optimization Report

## Initial Query
```sql
SELECT b.id AS booking_id, u.name AS user_name, p.name AS property_name, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id;
