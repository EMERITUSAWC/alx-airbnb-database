# Partitioning Performance Report for Bookings Table

## Objective

This report is about making our `bookings` data table faster. We're organizing it into smaller parts to make finding things quicker, especially when we look for bookings in a certain time (like all bookings in July).

## Database System Used

[**IMPORTANT: Write down what database you are using here.** Example: `PostgreSQL 14` or `MySQL 8.0`]

## Pre-Partitioning Setup (Before we made it organized)

Our `bookings` table was really big. It had [**Guess how many bookings!** Example: `millions` or `tens of millions`] of bookings. When we asked it to find bookings for a specific month, it was slow because it had to look through *all* the bookings.

**What our booking table looked like (simple idea):**

```sql
CREATE TABLE bookings (
    booking_id UNIQUE_ID,
    user_id WHO_BOOKED_IT_ID,
    property_id WHERE_THEY_BOOKED_ID,
    start_date WHEN_THEY_START_DATE,
    end_date WHEN_THEY_END_DATE,
    -- Plus other columns like price, status, etc.
);