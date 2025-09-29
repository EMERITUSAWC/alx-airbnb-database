-- User Table
CREATE TABLE "User" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Property Table
CREATE TABLE "Property" (
    id SERIAL PRIMARY KEY,
    host_id INTEGER NOT NULL REFERENCES "User"(id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    price_per_night NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Booking Table
CREATE TABLE "Booking" (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES "User"(id),
    property_id INTEGER NOT NULL REFERENCES "Property"(id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Payment Table
CREATE TABLE "Payment" (
    id SERIAL PRIMARY KEY,
    booking_id INTEGER NOT NULL REFERENCES "Booking"(id),
    amount NUMERIC(10,2) NOT NULL,
    paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50)
);

-- Indexes for performance
CREATE INDEX idx_booking_user_id ON "Booking"(user_id);
CREATE INDEX idx_property_host_id ON "Property"(host_id);
CREATE INDEX idx_booking_property_id ON "Booking"(property_id);
