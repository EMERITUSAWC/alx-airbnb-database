# Airbnb Clone - ER Diagram Requirements

## Tables Included
- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

## Key Relationships
- A User (host) can have many Properties
- A Property can have many Bookings
- A Booking is made by a User for a Property
- A Booking can have one Payment
- A Property can have many Reviews from Users
- Users can send Messages to other Users

## Constraints
- All tables use UUIDs as Primary Keys (indexed)
- Foreign Keys connect User, Property, Booking, and Payment tables
- ENUM fields used in User (role), Booking (status), and Payment (payment_method)
- `email` in User is UNIQUE and indexed
- Ratings in Review are between 1 and 5 (inclusive)

## Normalization
- The database follows 3NF
- No redundant data
- All relationships handled via foreign keys

## Deliverables
- ER diagram saved as `airbnb_erd.png`
- Diagram stored in `ERD/` folder along with this file
