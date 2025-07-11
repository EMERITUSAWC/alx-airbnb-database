# Optimization Report

## Initial Query Analysis

Before applying any optimization, the following query was used to retrieve bookings along with user, property, and payment details.

```sql
EXPLAIN SELECT bookings.id, users.name, properties.name, payments.amount
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.payment_id = payments.id;