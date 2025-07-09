-- 1. INNER JOIN: Bookings with their users
SELECT b.id AS booking_id, u.id AS user_id, u.name
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- 2. LEFT JOIN: Properties with their reviews (even those with no reviews)
SELECT p.id AS property_id, p.name, r.rating
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

-- 3. FULL OUTER JOIN: All users and all bookings
SELECT u.id AS user_id, u.name, b.id AS booking_id
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;
