-- Task 0: Write Complex Queries with Joins

-- Query 1: INNER JOIN
-- This query retrieves all bookings and the respective users who made those bookings.
SELECT
    b.id AS booking_id,
    b.booking_date,
    u.name AS user_name,
    u.email AS user_email
FROM
    bookings AS b
INNER JOIN
    users AS u ON b.user_id = u.id;


-- Query 2: LEFT JOIN
-- This query retrieves all properties and their reviews, including properties that have no reviews.
SELECT
    p.id AS property_id,
    p.name AS property_name,
    r.rating,
    r.comment
FROM
    properties AS p
LEFT JOIN
    reviews AS r ON p.id = r.property_id;


-- Query 3: FULL OUTER JOIN
-- This query retrieves all users and all bookings, even if a user has no booking or a booking has no user.
SELECT
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.booking_date
FROM
    users AS u
FULL OUTER JOIN
    bookings AS b ON u.id = b.user_id;
