-- 1. Insert into ROLE table
INSERT INTO role (role_id, role_name, description) VALUES
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'guest', 'Can book and review properties'),
    ('b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'host', 'Can create and manage properties'),
    ('c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'admin', 'Full system administrator privileges');

-- 2. Insert into PAYMENT_METHOD table
INSERT INTO payment_method (method_id, method_name, description) VALUES
    ('d3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'credit_card', 'Payment via credit card'),
    ('e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'paypal', 'Payment via PayPal'),
    ('f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'stripe', 'Payment via Stripe'),
    ('f6eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'mpesa', 'Payment via M-Pesa');

-- 3. Insert USERS (2 guests, 2 hosts, 1 admin) - Kenyan names
-- Password hashes are placeholders: "password123" hashed with bcrypt
INSERT INTO app_user (user_id, role_id, first_name, last_name, email, password_hash, phone_number) VALUES
    -- Guests
    ('11111111-1111-1111-1111-111111111111', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Wanjiku', 'Kamau', 'wanjiku.k@email.com', '$2b$10$92LXCEt4sINc4OkGd8SYP.LvzV5aIV.1QLoKqYhm7b/7JYVd0UJdS', '+254711123456'),
    ('22222222-2222-2222-2222-222222222222', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Kipchoge', 'Omondi', 'kipchoge.o@email.com', '$2b$10$92LXCEt4sINc4OkGd8SYP.LvzV5aIV.1QLoKqYhm7b/7JYVd0UJdS', '+254722234567'),

    -- Hosts
    ('33333333-3333-3333-3333-333333333333', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Auma', 'Odhiambo', 'auma.host@email.com', '$2b$10$92LXCEt4sINc4OkGd8SYP.LvzV5aIV.1QLoKqYhm7b/7JYVd0UJdS', '+254733345678'),
    ('44444444-4444-4444-4444-444444444444', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Mumbi', 'Waweru', 'mumbi.host@email.com', '$2b$10$92LXCEt4sINc4OkGd8SYP.LvzV5aIV.1QLoKqYhm7b/7JYVd0UJdS', '+254744456789'),

    -- Admin
    ('55555555-5555-5555-5555-555555555555', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Admin', 'Kenya', 'admin@kenyanbnb.com', '$2b$10$92LXCEt4sINc4OkGd8SYP.LvzV5aIV.1QLoKqYhm7b/7JYVd0UJdS', '+254700000000');

-- 4. Insert LOCATIONS in Kenyan regions
INSERT INTO location (location_id, street_address, city, state, postal_code, country, latitude, longitude) VALUES
    -- Nairobi County
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '123 Koinange Street', 'Nairobi', 'Nairobi County', '00100', 'Kenya', -1.292066, 36.821946),
    -- Mombasa County
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '456 Beach Road', 'Mombasa', 'Mombasa County', '80100', 'Kenya', -4.043477, 39.668206),
    -- Nakuru County
    ('cccccccc-cccc-cccc-cccc-cccccccccccc', '789 Lakeview Estate', 'Nakuru', 'Nakuru County', '20100', 'Kenya', -0.303099, 36.080026),
    -- Kisumu County
    ('dddddddd-dddd-dddd-dddd-dddddddddddd', '101 Lakeside Drive', 'Kisumu', 'Kisumu County', '40100', 'Kenya', -0.091702, 34.767956),
    -- Laikipia County (Safari)
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'Mpala Ranch', 'Nanyuki', 'Laikipia County', '10400', 'Kenya', 0.203333, 36.893056),
    -- Kilifi County (Beach)
    ('ffffffff-ffff-ffff-ffff-ffffffffffff', '234 Ocean View Road', 'Kilifi', 'Kilifi County', '80108', 'Kenya', -3.630451, 39.849915);

-- 5. Insert PROPERTIES (owned by our hosts) in Kenyan locations
INSERT INTO property (property_id, host_id, location_id, name, description, price_per_night) VALUES
    -- Auma's Properties (Nairobi & Mombasa)
    ('aaaaaaaa-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Nairobi City Apartment', 'Modern apartment in the heart of Nairobi CBD. Walking distance to restaurants, shops, and nightlife. Secure parking available.', 4500.00),
    ('bbbbbbbb-2222-2222-2222-222222222222', '33333333-3333-3333-3333-333333333333', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Mombasa Beach Villa', 'Luxury beachfront villa with private access to white sand beaches. Perfect for family vacations or romantic getaways.', 12000.00),

    -- Mumbi's Properties (Nakuru, Kisumu, Safari, Kilifi)
    ('cccccccc-3333-3333-3333-333333333333', '44444444-4444-4444-4444-444444444444', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'Lake Nakuru View Cottage', 'Cozy cottage with stunning views of Lake Nakuru and the flamingos. Great for bird watchers and nature lovers.', 3500.00),
    ('dddddddd-4444-4444-4444-444444444444', '44444444-4444-4444-4444-444444444444', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'Kisumu Lakeside Home', 'Spacious family home on the shores of Lake Victoria. Enjoy fresh fish and beautiful sunsets from the porch.', 5000.00),
    ('eeeeeeee-5555-5555-5555-555555555555', '44444444-4444-4444-4444-444444444444', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'Laikipia Safari Tent', 'Authentic luxury safari tent experience in the heart of wildlife country. Game drives included.', 8500.00),
    ('ffffffff-6666-6666-6666-666666666666', '44444444-4444-4444-4444-444444444444', 'ffffffff-ffff-ffff-ffff-ffffffffffff', 'Kilifi Beach Bandas', 'Traditional thatched bandas steps from the ocean. Experience Swahili culture and pristine beaches.', 3000.00);

-- 6. Insert BOOKINGS (mix of past and upcoming)
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, status) VALUES
    -- Past Completed Bookings
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'aaaaaaaa-1111-1111-1111-111111111111', '11111111-1111-1111-1111-111111111111', '2024-02-15', '2024-02-20', 'confirmed'),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'cccccccc-3333-3333-3333-333333333333', '22222222-2222-2222-2222-222222222222', '2024-03-10', '2024-03-15', 'confirmed'),

    -- Upcoming Bookings
    ('cccccccc-cccc-cccc-cccc-cccccccccccc', 'bbbbbbbb-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', '2024-07-01', '2024-07-07', 'confirmed'),
    ('dddddddd-dddd-dddd-dddd-dddddddddddd', 'eeeeeeee-5555-5555-5555-555555555555', '22222222-2222-2222-2222-222222222222', '2024-08-20', '2024-08-25', 'pending'),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'ffffffff-6666-6666-6666-666666666666', '11111111-1111-1111-1111-111111111111', '2024-09-10', '2024-09-15', 'confirmed');

-- 7. Insert PAYMENTS for the confirmed bookings (using M-Pesa for some)
INSERT INTO payment (payment_id, booking_id, method_id, amount, payment_date, transaction_id, status) VALUES
    ('aaaaaaaa-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'f6eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 22500.00, '2024-02-10 14:30:00', 'MPE_12345678', 'completed'),
    ('bbbbbbbb-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 17500.00, '2024-03-05 09:15:00', 'ch_1A2B3C4D5E', 'completed'),
    ('cccccccc-3333-3333-3333-333333333333', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'f6eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 84000.00, '2024-06-20 16:45:00', 'MPE_87654321', 'completed'),
    ('dddddddd-4444-4444-4444-444444444444', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'f6eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 15000.00, '2024-08-25 11:20:00', 'MPE_11223344', 'completed');

-- 8. Insert REVIEWS for the completed stays
INSERT INTO review (review_id, property_id, user_id, rating, comment) VALUES
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'aaaaaaaa-1111-1111-1111-111111111111', '11111111-1111-1111-1111-111111111111', 5, 'Perfect location in Nairobi! The apartment was clean and secure. Auma was very helpful with local recommendations. Asante sana!'),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'cccccccc-3333-3333-3333-333333333333', '22222222-2222-2222-2222-222222222222', 4, 'Beautiful view of Lake Nakuru and the flamingos. The cottage was cozy and had everything we needed. Will visit again!');

-- 9. Insert MESSAGES (conversation between a guest and a host)
INSERT INTO message (message_id, sender_id, recipient_id, message_body) VALUES
    -- Wanjiku messaging Auma about her property
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 'Habari Auma, I''m interested in your Nairobi apartment for next month. Is it available?'),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '33333333-3333-3333-3333-333333333333', '11111111-1111-1111-1111-111111111111', 'Habari Wanjiku! Yes, those dates are open. The apartment is in a great location near Maasai Market. Karibu sana!'),
    ('cccccccc-cccc-cccc-cccc-cccccccccccc', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 'Asante! I''ve just booked. Can you recommend a good nyama choma place nearby?'),

    -- Kipchoge messaging Mumbi about safari
    ('dddddddd-dddd-dddd-dddd-dddddddddddd', '22222222-2222-2222-2222-222222222222', '44444444-4444-4444-4444-444444444444', 'Hello Mumbi, is the safari tent experience suitable for children?'),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '44444444-4444-4444-4444-444444444444', '22222222-2222-2222-2222-222222222222', 'Yes, absolutely! Many families with children enjoy the safari experience. We have experienced guides and secure facilities.');