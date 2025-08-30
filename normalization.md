# AirBnB Schema - 3NF Normalization Summary

## Normalization Steps

### 1. Remove Derived Attributes
- **Removed:** `total_price` from BOOKING (can be calculated from `pricepernight` × duration)

### 2. Eliminate Transitive Dependencies
- **Created LOCATION table:** Extracted address components from PROPERTY
- **Created ROLE table:** Extracted role data from USER
- **Created PAYMENT_METHOD table:** Extracted payment method details from PAYMENT

### 3. Add Missing Attributes
- **Added:** `is_active` flags for soft deletion
- **Added:** `transaction_id` for payment tracking
- **Added:** `is_read` flag for messages
- **Added:** Geospatial coordinates (`latitude`, `longitude`)

## 3NF-Compliant Schema
- **USER (PK: user_id)** → ROLE
- **ROLE (PK: role_id)**
- **LOCATION (PK: location_id)**
- **PROPERTY (PK: property_id)** → USER, LOCATION
- **BOOKING (PK: booking_id)** → USER, PROPERTY
- **PAYMENT (PK: payment_id)** → BOOKING, PAYMENT_METHOD
- **PAYMENT_METHOD (PK: method_id)**
- **REVIEW (PK: review_id)** → USER, PROPERTY
- **MESSAGE (PK: message_id)** → USER(sender), USER(recipient)


## Benefits Achieved
- ✅ No partial dependencies
- ✅ No transitive dependencies  
- ✅ Minimal data redundancy
- ✅ Improved data integrity
- ✅ Better scalability for new features