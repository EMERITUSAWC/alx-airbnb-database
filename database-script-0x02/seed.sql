-- Ensure uuid-ossp extension is available (required for uuid_generate_v4)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Insert Users
INSERT INTO "User" ("user_id", "first_name", "last_name", "email", "password_hash", "phone_number", "role")
VALUES
  (uuid_generate_v4(), 'Ama', 'Mensah', 'ama@example.com', 'hashed_password1', '1234567890', 'guest'),
  (uuid_generate_v4(), 'Kwame', 'Boateng', 'kwame@example.com', 'hashed_password2', '0987654321', 'host'),
  (uuid_generate_v4(), 'Yaw', 'Ofori', 'yaw@example.com', 'hashed_password3', '1122334455', 'admin');

-- Insert Properties
INSERT INTO "Property" ("property_id", "host_id", "name", "description", "location", "pricepernight")
VALUES
  (uuid_generate_v4(), 
   (SELECT "user_id" FROM "User" WHERE "first_name" = 'Kwame' AND "last_name" = 'Boateng' LIMIT 1), 
   'Cozy Apartment in Accra', 'A beautiful 2-bedroom apartment', 'Accra', 150.00),
  (uuid_generate_v4(), 
   (SELECT "user_id" FROM "User" WHERE "first_name" = 'Kwame' AND "last_name" = 'Boateng' LIMIT 1), 
   'Beach House in Takoradi', 'A 3-bedroom house by the beach', 'Takoradi', 200.00);

-- Insert Bookings
INSERT INTO "Booking" ("booking_id", "property_id", "user_id", "start_date", "end_date", "total_price", "status")
VALUES
  (uuid_generate_v4(), 
   (SELECT "property_id" FROM "Property" WHERE "name" = 'Cozy Apartment in Accra' LIMIT 1), 
   (SELECT "user_id" FROM "User" WHERE "first_name" = 'Ama' AND "last_name" = 'Mensah' LIMIT 1), 
   '2025-10-01', '2025-10-05', 600.00, 'confirmed'),
  (uuid_generate_v4(), 
   (SELECT "property_id" FROM "Property" WHERE "name" = 'Beach House in Takoradi' LIMIT 1), 
   (SELECT "user_id" FROM "User" WHERE "first_name" = 'Ama' AND "last_name" = 'Mensah' LIMIT 1), 
   '2025-10-10', '2025-10-15', 1000.00, 'pending');

-- Insert Payments
INSERT INTO "Payment" ("payment_id", "booking_id", "amount", "payment_method")
VALUES
  (uuid_generate_v4(), 
   (SELECT "booking_id" FROM "Booking" WHERE "total_price" = 600.00 LIMIT 1), 600.00, 'credit_card'),
  (uuid_generate_v4(), 
   (SELECT "booking_id" FROM "Booking" WHERE "total_price" = 1000.00 LIMIT 1), 1000.00, 'paypal');

-- Insert Reviews
INSERT INTO "Review" ("review_id", "property_id", "user_id", "rating", "comment")
VALUES
  (uuid_generate_v4(), 
   (SELECT "property_id" FROM "Property" WHERE "name" = 'Cozy Apartment in Accra' LIMIT 1), 
   (SELECT "user_id" FROM "User" WHERE "first_name" = 'Ama' AND "last_name" = 'Mensah' LIMIT 1), 
   5, 'Amazing stay! Highly recommend this apartment.'),
  (uuid_generate_v4(), 
   (SELECT "property_id" FROM "Property" WHERE "name" = 'Beach House in Takoradi' LIMIT 1), 
   (SELECT "user_id" FROM "User" WHERE "first_name" = 'Ama' AND "last_name" = 'Mensah' LIMIT 1), 
   4, 'The house was great, but the beach could be cleaner.');

-- Insert Messages
INSERT INTO "Message" ("message_id", "sender_id", "recipient_id", "message_body")
VALUES
  (uuid_generate_v4(), 
   (SELECT "user_id" FROM "User" WHERE "first_name" = 'Ama' AND "last_name" = 'Mensah' LIMIT 1), 
   (SELECT "user_id" FROM "User" WHERE "first_name" = 'Kwame' AND "last_name" = 'Boateng' LIMIT 1), 
   'Hi Kwame, I would like to book your property. Can you provide more details?'),
  (uuid_generate_v4(), 
   (SELECT "user_id" FROM "User" WHERE "first_name" = 'Kwame' AND "last_name" = 'Boateng' LIMIT 1), 
   (SELECT "user_id" FROM "User" WHERE "first_name" = 'Ama' AND "last_name" = 'Mensah' LIMIT 1), 
   'Sure! Please let me know the dates you prefer.');
