-- Index user_id in bookings for faster JOINs and lookups
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index property_id in bookings for faster JOINs
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index property_id in reviews to optimize JOIN with properties
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Index email in users table to optimize search/login
CREATE INDEX idx_users_email ON users(email);

-- Index created_at in bookings for sorting/filtering by date
CREATE INDEX idx_bookings_created_at ON bookings(created_at);