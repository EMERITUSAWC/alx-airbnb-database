-- partitioning.sql (for PostgreSQL)

-- 1. Rename the original bookings table (optional but good practice)
-- This is like moving your old messy toy box out of the way.
ALTER TABLE bookings RENAME TO bookings_old;

-- 2. Create the new partitioned table (parent table)
-- This is like creating a new, super-organized toy box with little compartments for each type of toy (based on when the booking starts).
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- If you had other columns in your old bookings table, copy them here too!
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_property
        FOREIGN KEY (property_id)
        REFERENCES properties(property_id)
        ON DELETE CASCADE
) PARTITION BY RANGE (start_date); -- This tells it to organize by date range!

-- 3. Create partitions for specific date ranges
-- These are the actual little compartments in your new toy box.
-- We'll make one for each quarter (3 months) for a few years.
-- You can add more for older or newer years if you have data there.

-- 2023 compartments
CREATE TABLE bookings_2023_q1 PARTITION OF bookings
FOR VALUES FROM ('2023-01-01') TO ('2023-04-01');

CREATE TABLE bookings_2023_q2 PARTITION OF bookings
FOR VALUES FROM ('2023-04-01') TO ('2023-07-01');

CREATE TABLE bookings_2023_q3 PARTITION OF bookings
FOR VALUES FROM ('2023-07-01') TO ('2023-10-01');

CREATE TABLE bookings_2023_q4 PARTITION OF bookings
FOR VALUES FROM ('2023-10-01') TO ('2024-01-01');

-- 2024 compartments
CREATE TABLE bookings_2024_q1 PARTITION OF bookings
FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');

CREATE TABLE bookings_2024_q2 PARTITION OF bookings
FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

CREATE TABLE bookings_2024_q3 PARTITION OF bookings
FOR VALUES FROM ('2024-07-01') TO ('2024-10-01');

CREATE TABLE bookings_2024_q4 PARTITION OF bookings
FOR VALUES FROM ('2024-10-01') TO ('2025-01-01');

-- 2025 compartments (and you'd add more as new bookings happen in the future!)
CREATE TABLE bookings_2025_q1 PARTITION OF bookings
FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

CREATE TABLE bookings_2025_q2 PARTITION OF bookings
FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

-- ... you can add more partitions for other years/quarters as needed.

-- 4. Migrate existing data from the old table to the new partitioned table
-- This is like taking all the toys from the old messy box and putting them into the right compartments in the new organized box.
INSERT INTO bookings SELECT * FROM bookings_old;

-- 5. Drop the old table after successful migration (DANGER: make sure it worked first!)
-- Only do this if you are SUPER sure all the toys are in the new box correctly!
-- DROP TABLE bookings_old;

-- 6. Recreate indexes on the new organized table
-- Indexes are like a quick table of contents to find your toys faster.
-- These indexes will now work across all the compartments.
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_start_date ON bookings (start_date);