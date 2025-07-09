-- 1. INNER JOIN: all bookings and the users who made them
SELECT bookings.*, users.*
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

-- 2. LEFT JOIN: all properties and their reviews (including those with no reviews)
SELECT properties.*, reviews.*
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

-- 3. FULL OUTER JOIN: all users and all bookings, even without a match
SELECT users.*, bookings.*
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id
UNION
SELECT users.*, bookings.*
FROM users
RIGHT JOIN bookings ON users.id = bookings.user_id;
