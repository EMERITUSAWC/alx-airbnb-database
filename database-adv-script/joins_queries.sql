-- Task: Retrieve all properties and their reviews (including properties with no reviews)
SELECT properties.id AS property_id, properties.name, reviews.id AS review_id, reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id
ORDER BY properties.id;
