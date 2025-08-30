# AirBnB Database Schema - Summary

## ENUM Types Created
- `user_role`: `('guest', 'host', 'admin')`
- `booking_status`: `('pending', 'confirmed', 'cancelled')`
- `payment_method_type`: `('credit_card', 'paypal', 'stripe')`
- `payment_status`: `('pending', 'completed', 'failed', 'refunded')`

## Tables Created (in recommended order)
1. **Reference Tables**: `role`, `payment_method`
2. **Core Tables**: `app_user`, `location`
3. **Business Tables**: `property`, `booking`, `payment`, `review`, `message`

## Key Indexes Added
- **Foreign Key Indexes**: All FK columns indexed for join performance
- **Unique Constraints**: `app_user(email)`, `payment(booking_id)`, `review(property_id, user_id)`
- **Query Optimization**: 
  - `booking(start_date, end_date, status)` - availability searches
  - `message(is_read)` - partial index for unread messages
  - `property(price_per_night)` - price filtering

## Initial Data
- **Roles**: guest, host, admin
- **Payment Methods**: credit_card, paypal, stripe

The schema is normalized to 3NF with proper constraints and optimized indexes for production use.