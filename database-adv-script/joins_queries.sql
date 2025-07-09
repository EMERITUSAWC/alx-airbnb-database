SELECT properties.id AS property_id, properties.name, reviews.rating
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;
