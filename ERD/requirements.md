# Airbnb Database Entity-Relationship Diagram (ERD)

## Entities and Attributes

1. **User**
   - id (PK)
   - name
   - email
   - phone
   - created_at

2. **Property**
   - id (PK)
   - host_id (FK: User)
   - title
   - description
   - location
   - price_per_night
   - created_at

3. **Booking**
   - id (PK)
   - user_id (FK: User)
   - property_id (FK: Property)
   - start_date
   - end_date
   - status
   - created_at

4. **Payment**
   - id (PK)
   - booking_id (FK: Booking)
   - amount
   - paid_at
   - payment_method

## Relationships

- A User (guest) can have many Bookings.
- A Property belongs to a User (host).
- A Booking is for one Property and made by one User.
- A Payment is for one Booking.

## Diagram

The ER diagram visually shows these tables and relationships. See `erd.png`.

**Assumptions:**
- A property can have only one host.
- Users can be both hosts and guests.
- Each booking must have a payment.

