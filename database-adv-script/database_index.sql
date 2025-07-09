-- Indexes to improve performance
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- Performance check with EXPLAIN ANALYZE
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 1;
