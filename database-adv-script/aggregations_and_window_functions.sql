-- aggregations_and_window_functions.sql

-- Query 1: Find the total number of bookings made by each user
-- This query uses the COUNT aggregate function along with GROUP BY
-- to summarize the number of bookings for each unique user.
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings_made
FROM
    users u
LEFT JOIN
    bookings b ON u.user_id = b.user_id
GROUP BY
    u.user_id, u.first_name, u.last_name
ORDER BY
    total_bookings_made DESC, u.user_id ASC;

-- Query 2: Rank properties based on the total number of bookings they have received
-- This query first calculates the total bookings for each property using a CTE (Common Table Expression).
-- Then, it applies a window function (ROW_NUMBER() in this case) to assign a rank
-- to each property based on their total booking count. RANK() could also be used here,
-- depending on how ties should be handled (ROW_NUMBER gives unique ranks, RANK gives same rank for ties).
WITH PropertyBookingCounts AS (
    SELECT
        p.property_id,
        p.name AS property_name, -- Assuming 'name' is the property's name column
        COUNT(b.booking_id) AS total_bookings_received
    FROM
        properties p
    LEFT JOIN
        bookings b ON p.property_id = b.property_id
    GROUP BY
        p.property_id, p.name
)
SELECT
    property_id,
    property_name,
    total_bookings_received,
    ROW_NUMBER() OVER (ORDER BY total_bookings_received DESC, property_id ASC) AS rank_by_bookings
FROM
    PropertyBookingCounts
ORDER BY
    rank_by_bookings ASC;

-- If you prefer to use RANK() instead, you can uncomment and use the following:
/*
WITH PropertyBookingCounts AS (
    SELECT
        p.property_id,
        p.name AS property_name,
        COUNT(b.booking_id) AS total_bookings_received
    FROM
        properties p
    LEFT JOIN
        bookings b ON p.property_id = b.property_id
    GROUP BY
        p.property_id, p.name
)
SELECT
    property_id,
    property_name,
    total_bookings_received,
    RANK() OVER (ORDER BY total_bookings_received DESC) AS rank_by_bookings_with_ties
FROM
    PropertyBookingCounts
ORDER BY
    rank_by_bookings_with_ties ASC;
*/
