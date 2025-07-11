-- Initial complex query joining bookings with users, properties, and payments
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;

-- Analyze the query performance
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;