-- LEFT JOIN: Get all properties and their reviews, including properties with no reviews
SELECT properties.id, properties.name, reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;
