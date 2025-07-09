-- Query to retrieve all properties and their reviews (including properties with no reviews)
SELECT p.*, r.*
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;
