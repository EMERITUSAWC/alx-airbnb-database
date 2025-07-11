-- aggregations_and_window_functions.sql

-- Part 1: Query to find the total number of bookings made by each user.
-- This query uses COUNT() to count bookings and GROUP BY to aggregate them per user.
SELECT
    user_id,
    COUNT(id) AS total_bookings
FROM
    bookings
GROUP BY
    user_id
ORDER BY
    total_bookings DESC;

-- Part 2: Query to rank properties based on their total number of bookings.
-- This uses a window function (RANK) to rank properties after counting their bookings in a CTE.
WITH PropertyBookingCounts AS (
    -- First, we count the number of bookings for each property
    SELECT
        property_id,
        COUNT(id) AS booking_count
    FROM
        bookings
    GROUP BY
        property_id
)
-- Now, we select the data and apply the RANK() window function
SELECT
    property_id,
    booking_count,
    RANK() OVER (ORDER BY booking_count DESC) AS property_rank
FROM
    PropertyBookingCounts
ORDER BY
    property_rank;
