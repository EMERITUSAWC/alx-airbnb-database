-- 2. Ranking properties by total bookings using RANK()
SELECT
    properties.id AS property_id,
    properties.name,
    COUNT(bookings.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(bookings.id) DESC) AS rank
FROM properties
LEFT JOIN bookings ON properties.id = bookings.property_id
GROUP BY properties.id, properties.name
ORDER BY total_bookings DESC;