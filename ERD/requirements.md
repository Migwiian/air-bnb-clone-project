erDiagram
    USER {
        uuid user_id PK "Primary Key, Indexed"
        string first_name NOT NULL
        string last_name NOT NULL
        string email NOT NULL UNIQUE
        string password_hash NOT NULL
        string phone_number NULL
        enum role NOT NULL "guest, host, admin"
        timestamp created_at DEFAULT CURRENT_TIMESTAMP
    }
    
    PROPERTY {
        uuid property_id PK "Primary Key, Indexed"
        uuid host_id FK "References User(user_id)"
        string name NOT NULL
        text description NOT NULL
        string location NOT NULL
        decimal pricepernight NOT NULL
        timestamp created_at DEFAULT CURRENT_TIMESTAMP
        timestamp updated_at "ON UPDATE CURRENT_TIMESTAMP"
    }
    
    BOOKING {
        uuid booking_id PK "Primary Key, Indexed"
        uuid property_id FK "References Property(property_id)"
        uuid user_id FK "References User(user_id)"
        date start_date NOT NULL
        date end_date NOT NULL
        decimal total_price NOT NULL
        enum status NOT NULL "pending, confirmed, canceled"
        timestamp created_at DEFAULT CURRENT_TIMESTAMP
    }
    
    PAYMENT {
        uuid payment_id PK "Primary Key, Indexed"
        uuid booking_id FK "References Booking(booking_id)"
        decimal amount NOT NULL
        timestamp payment_date DEFAULT CURRENT_TIMESTAMP
        enum payment_method NOT NULL "credit_card, paypal, stripe"
    }
    
    REVIEW {
        uuid review_id PK "Primary Key, Indexed"
        uuid property_id FK "References Property(property_id)"
        uuid user_id FK "References User(user_id)"
        integer rating NOT NULL "CHECK: 1-5"
        text comment NOT NULL
        timestamp created_at DEFAULT CURRENT_TIMESTAMP
    }
    
    MESSAGE {
        uuid message_id PK "Primary Key, Indexed"
        uuid sender_id FK "References User(user_id)"
        uuid recipient_id FK "References User(user_id)"
        text message_body NOT NULL
        timestamp sent_at DEFAULT CURRENT_TIMESTAMP
    }

    USER ||--o{ PROPERTY : hosts
    USER ||--o{ BOOKING : makes
    USER ||--o{ REVIEW : writes
    USER ||--o{ MESSAGE : sends
    USER }|--o{ MESSAGE : receives
    
    PROPERTY ||--o{ BOOKING : has
    PROPERTY ||--o{ REVIEW : receives
    
    BOOKING ||--|| PAYMENT : has
    BOOKING ||--o{ REVIEW : generates