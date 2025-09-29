-- Users
INSERT INTO "User" (name, email, phone) VALUES
('Ama Mensah', 'ama@example.com', '0244000001'),
('Kwame Boateng', 'kwame@example.com', '0244000002'),
('Yaw Ofori', 'yaw@example.com', '0244000003');

-- Properties
INSERT INTO "Property" (host_id, title, description, location, price_per_night) VALUES
(1, 'Accra Cozy Apartment', 'A lovely apartment near Accra Mall.', 'Accra', 350.00),
(2, 'Kumasi Guest House', 'Spacious rooms for families.', 'Kumasi', 250.00),
(3, 'Takoradi Beach Home', 'Seaside house with a great view.', 'Takoradi', 500.00);

-- Bookings
INSERT INTO "Booking" (user_id, property_id, start_date, end_date, status) VALUES
(2, 1, '2025-07-01', '2025-07-05', 'confirmed'),
(3, 2, '2025-07-03', '2025-07-07', 'pending'),
(1, 3, '2025-07-10', '2025-07-12', 'confirmed');

-- Payments
INSERT INTO "Payment" (booking_id, amount, payment_method) VALUES
(1, 1400.00, 'Mobile Money'),
(2, 1000.00, 'Credit Card'),
(3, 1000.00, 'Cash');
