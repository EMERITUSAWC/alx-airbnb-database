-- 1. Total number of bookings per user
SELECT
  user_id,
  COUNT(*) AS total_bookings
FROM
  bookings
GROUP BY
  user_id;

-- 2. RANK properties by number of bookings
SELECT
  p.id AS property_id,
  p.name AS property_name,
  COUNT(b.id) AS booking_count,
  RANK() OVER (ORDER BY COUNT(b.id) DESC) AS rank
FROM
  properties p
LEFT JOIN
  bookings b ON p.id = b.property_id
GROUP BY
  p.id, p.name
ORDER BY
  rank;
