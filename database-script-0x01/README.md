# Database Schema Documentation

## Overview
This file documents the schema for an Airbnb-like application database. The schema includes four core tables: `User`, `Property`, `Booking`, and `Payment`.

### Tables:

#### **User Table**
- Stores user data (guests and hosts).
- **Primary Key**: id (auto-incremented).
- **Attributes**:
  - `name`: Name of the user.
  - `email`: Unique email address of the user.
  - `phone`: Phone number of the user.
  - `created_at`: Timestamp of when the user was created.

#### **Property Table**
- Stores information about properties listed on the platform.
- **Primary Key**: id (auto-incremented).
- **Foreign Key**: host_id (references `User.id`).
- **Attributes**:
  - `title`: Title of the property.
  - `description`: Description of the property.
  - `location`: Location of the property.
  - `price_per_night`: The cost per night for renting the property.
  - `created_at`: Timestamp of when the property was listed.

#### **Booking Table**
- Stores information about bookings made by users for properties.
- **Primary Key**: id (auto-incremented).
- **Foreign Keys**: `user_id` (references `User.id`), `property_id` (references `Property.id`).
- **Attributes**:
  - `start_date`: The starting date of the booking.
  - `end_date`: The ending date of the booking.
  - `status`: The status of the booking (e.g., confirmed, pending).
  - `created_at`: Timestamp of when the booking was made.

#### **Payment Table**
- Stores information about payments made for bookings.
- **Primary Key**: id (auto-incremented).
- **Foreign Key**: `booking_id` (references `Booking.id`).
- **Attributes**:
  - `amount`: The amount paid for the booking.
  - `paid_at`: Timestamp of when the payment was made.
  - `payment_method`: The method used to pay (e.g., Credit Card, Mobile Money).

### Indexes
- `idx_booking_user_id`: Index on `user_id` in the `Booking` table for faster search.
- `idx_property_host_id`: Index on `host_id` in the `Property` table for faster search.
- `idx_booking_property_id`: Index on `property_id` in the `Booking` table for faster search.

