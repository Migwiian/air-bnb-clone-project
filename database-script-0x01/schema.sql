-- ENUM types
CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin');
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'cancelled');
CREATE TYPE payment_method_type AS ENUM ('credit_card', 'paypal', 'stripe');
CREATE TYPE payment_status AS ENUM ('pending', 'completed', 'failed', 'refunded');

--Lookup/reference tables first to satisfy foreign key constraints

CREATE TABLE role (
    role_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    role_name VARCHAR(50) NOT NULL UNIQUE,
    permissions JSONB,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payment_method (
    method_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    method_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Core entity tables

CREATE TABLE app_user (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    role_id UUID NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_user_role
        FOREIGN KEY (role_id)
        REFERENCES role(role_id)
        ON DELETE RESTRICT
);

CREATE TABLE location (
    location_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100) NOT NULL,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 4. Create tables with foreign key dependencies

CREATE TABLE property (
    property_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    host_id UUID NOT NULL,
    location_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL CHECK (price_per_night > 0),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_property_host
        FOREIGN KEY (host_id)
        REFERENCES app_user(user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_property_location
        FOREIGN KEY (location_id)
        REFERENCES location(location_id)
        ON DELETE RESTRICT
);

CREATE TABLE booking (
    booking_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status booking_status NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_dates CHECK (end_date > start_date),
    CONSTRAINT fk_booking_property
        FOREIGN KEY (property_id)
        REFERENCES property(property_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_booking_user
        FOREIGN KEY (user_id)
        REFERENCES app_user(user_id)
        ON DELETE CASCADE
);

CREATE TABLE payment (
    payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    booking_id UUID NOT NULL UNIQUE, -- Ensures one-to-one relationship
    method_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    payment_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    transaction_id VARCHAR(255),
    status payment_status NOT NULL DEFAULT 'pending',
    CONSTRAINT fk_payment_booking
        FOREIGN KEY (booking_id)
        REFERENCES booking(booking_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_payment_method
        FOREIGN KEY (method_id)
        REFERENCES payment_method(method_id)
        ON DELETE RESTRICT
);

CREATE TABLE review (
    review_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_property
        FOREIGN KEY (property_id)
        REFERENCES property(property_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_review_user
        FOREIGN KEY (user_id)
        REFERENCES app_user(user_id)
        ON DELETE CASCADE,
    CONSTRAINT uq_property_user_review UNIQUE (property_id, user_id) -- Prevent multiple reviews by same user for same property
);

CREATE TABLE message (
    message_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_message_sender
        FOREIGN KEY (sender_id)
        REFERENCES app_user(user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_message_recipient
        FOREIGN KEY (recipient_id)
        REFERENCES app_user(user_id)
        ON DELETE CASCADE
);
-- 5. Create indexes for performance optimization (Foreign Keys and frequently queried columns)

-- Indexes for User table
CREATE INDEX idx_user_email ON app_user(email);
CREATE INDEX idx_user_role ON app_user(role_id);

-- Indexes for Property table
CREATE INDEX idx_property_host ON property(host_id);
CREATE INDEX idx_property_location ON property(location_id);
CREATE INDEX idx_property_price ON property(price_per_night);

-- Indexes for Booking table
CREATE INDEX idx_booking_property ON booking(property_id);
CREATE INDEX idx_booking_user ON booking(user_id);
CREATE INDEX idx_booking_dates ON booking(start_date, end_date);
CREATE INDEX idx_booking_status ON booking(status);

-- Indexes for Payment table
CREATE INDEX idx_payment_booking ON payment(booking_id);
CREATE INDEX idx_payment_method ON payment(method_id);
CREATE INDEX idx_payment_status ON payment(status);

-- Indexes for Review table
CREATE INDEX idx_review_property ON review(property_id);
CREATE INDEX idx_review_user ON review(user_id);
CREATE INDEX idx_review_rating ON review(rating);

-- Indexes for Message table
CREATE INDEX idx_message_sender ON message(sender_id);
CREATE INDEX idx_message_recipient ON message(recipient_id);
CREATE INDEX idx_message_sent_at ON message(sent_at);
CREATE INDEX idx_message_is_read ON message(is_read) WHERE is_read = FALSE; -- Partial index for unread messages