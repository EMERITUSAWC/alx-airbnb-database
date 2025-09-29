# Normalization of the Airbnb Database Schema

## First Normal Form (1NF)
- All attributes in the tables contain atomic values.
- There are no repeating groups or arrays in any table.

## Second Normal Form (2NF)
- All non-key attributes depend fully on the primary key.
- The **Booking** table does not store property or user information directly. It references the **User** and **Property** tables using foreign keys (`user_id`, `property_id`).

## Third Normal Form (3NF)
- All non-key attributes depend only on the primary key and not on other non-key attributes.
- For example, **User** contains only user-specific information, and **Property** contains only property-specific information. The **Booking** table does not contain user or property data directly, instead referencing them through foreign keys.

The schema is now in **3NF** and optimized for performance and data integrity.
