-- 1. Total number of bookings made by each user
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id
ORDER BY total_bookings DESC;

-- 2. Rank properties by total number of bookings using ROW_NUMBER()
SELECT
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM bookings
GROUP BY property_id;
