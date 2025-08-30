# Air-Bnb Database

A PostgreSQL database schema for a Airbnb-like platform.

## 🗄️ Schema Overview

**Core Tables:**
- `app_user` - Users (guests, hosts, admins)
- `role` - User roles and permissions
- `property` - Accommodation listings
- `location` - Kenyan geographic data
- `booking` - Reservation records
- `payment` - Transaction records
- `review` - Guest reviews
- `message` - User communications

## 🌍 Kenyan Features

- **Locations:** Properties across 6 Kenyan counties (Nairobi, Mombasa, Nakuru, Kisumu, Laikipia, Kilifi)
- **Payment:** M-Pesa integration alongside credit cards
- **Users:** Local Kenyan names and phone numbers (+254)
- **Content:** Swahili phrases in sample messages and reviews

## Sample Data Includes
- 5 users (2 guests, 2 hosts, 1 admin)

- 6 properties across Kenya

- 5 bookings (past and upcoming)

- 4 payments (including M-Pesa transactions)

- 2 reviews and 5 messages

## Key Constraints
- **Data Integrity:** Foreign keys, check constraints, unique constraints

- **Security:** Password hashing, role-based access

- **Validation:** Rating limits (1-5), date validation, price checks

## Indexing Strategy**
- Optimized for common queries:**

- User authentication (email)

- Property search (location_id, price_per_night)

- Booking management (status, dates)

- Message tracking (is_read partial index)