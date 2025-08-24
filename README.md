# AirBnB Clone - Backend

## Overview
Backend service for an AirBnB-style marketplace platform. Built with Django and Django REST Framework, this API handles user management, property listings, bookings, payments, and reviews.

## Features
- **User Management**: Registration, authentication, and profile management
- **Property Management**: CRUD operations for property listings
- **Booking System**: Reservation management with check-in/out functionality
- **Payment Processing**: Transaction handling for bookings
- **Review System**: Property reviews and ratings
- **API Documentation**: OpenAPI standard documentation

## Tech Stack
- **Framework**: Django + Django REST Framework
- **Database**: PostgreSQL
- **Query Language**: GraphQL (optional flexible querying)
- **Async Tasks**: Celery
- **Caching**: Redis
- **Containerization**: Docker
- **CI/CD**: Automated testing and deployment pipelines

## Technology Stack Overview
- **Django**: The high-level Python web framework that provides the foundation for the entire project, handling URL routing, views, and models.
- **Django REST Framework (DRF)**: A powerful toolkit built on top of Django for constructing RESTful APIs, providing serializers, authentication, and browsable API views.
- **PostgreSQL**: A robust, open-source relational database system used for storing all application data (users, properties, bookings, etc.) with high reliability and performance.
- **GraphQL**: A query language for APIs that allows clients to request exactly the data they need, enabling more efficient data retrieval compared to traditional REST endpoints.
- **Celery**: A distributed task queue used to handle background jobs asynchronously, such as sending confirmation emails or processing payments.
- **Redis**: An in-memory data structure store used as a cache to speed up frequent database queries and as a message broker for Celery.
- **Docker**: A platform for developing, shipping, and running applications in containers, ensuring consistency across different development and production environments.

## Database Design
### Key Entities & Relationships
- **Users**
  - *Fields:* `id`, `username`, `email`, `password_hash`, `profile_info`
  - *Relationships:* A User can have many Properties (as a host). A User can have many Bookings (as a guest).

- **Properties**
  - *Fields:* `id`, `title`, `description`, `price_per_night`, `host_id` (Foreign Key to Users)
  - *Relationships:* A Property belongs to one User (host). A Property can have many Bookings. A Property can have many Reviews.

- **Bookings**
  - *Fields:* `id`, `check_in_date`, `check_out_date`, `total_price`, `guest_id` (Foreign Key to Users), `property_id` (Foreign Key to Properties)
  - *Relationships:* A Booking belongs to one User (guest). A Booking belongs to one Property.

- **Reviews**
  - *Fields:* `id`, `rating`, `comment`, `guest_id` (Foreign Key to Users), `property_id` (Foreign Key to Properties)
  - *Relationships:* A Review belongs to one User (guest). A Review belongs to one Property.

- **Payments**
  - *Fields:* `id`, `amount`, `status`, `booking_id` (Foreign Key to Bookings), `transaction_id`
  - *Relationships:* A Payment belongs to one Booking.

## Feature Breakdown
- **User Management**: This feature allows users to create accounts, securely log in, and manage their personal information. It is the foundation for personalizing the experience and controlling access.
- **Property Management**: This enables hosts to list their properties, including descriptions, photos, and prices. It is the core of the marketplace, providing the inventory for guests to book.
- **Booking System**: This feature handles the entire reservation lifecycle, from checking availability and creating a booking to managing check-in/out dates. It directly facilitates the primary transaction between guest and host.
- **Payment Processing**: This securely handles financial transactions, integrating with a payment gateway to process payments for bookings. It is critical for monetizing the platform and ensuring trust.
- **Review System**: This allows guests to leave ratings and feedback for properties they've stayed at. It builds trust and community on the platform by providing social proof for hosts and properties.

## API Security Overview
Securing our APIs is paramount to protect user data and maintain trust. Key security measures will include:

- **Authentication**: Verifying user identity, primarily using token-based authentication (JWT) to ensure that only legitimate users can access the system.
- **Authorization**: Controlling user permissions after authentication (e.g., ensuring a user can only edit their own profile or property listings).
- **Data Encryption**: Using HTTPS (TLS) for all communications to encrypt data in transit between the client and server.
- **Input Validation & Sanitization**: rigorously checking all incoming data to prevent common vulnerabilities like SQL Injection and Cross-Site Scripting (XSS).
- **Rate Limiting**: Protecting against abuse and Denial-of-Service (DoS) attacks by limiting how often a user can make requests to the API within a given time frame.

Security is crucial for protecting sensitive user data (like personal info and passwords), securing financial transactions during payments, and ensuring the overall stability and reliability of the platform.

## CI/CD Pipeline Overview
CI/CD (Continuous Integration and Continuous Deployment) is a method to frequently deliver apps to users by automating the integration and deployment stages.

- **Continuous Integration (CI)**: Developers regularly merge code changes into a central repository, where automated builds and tests are run. This helps to catch bugs early and improve software quality.
- **Continuous Deployment (CD)**: Code changes that pass the automated tests are automatically deployed to a staging or production environment, enabling rapid and reliable releases.

For this project, we will use **GitHub Actions** to automate our testing and deployment workflows. These pipelines will be containerized using **Docker** to ensure environment consistency from development to production. This automation is important for maintaining high code quality, accelerating release cycles, and reducing manual errors during deployment.

## API Endpoints
### Users
- `GET /users/` - List all users
- `POST /users/` - Create new user
- `GET /users/{user_id}/` - Retrieve specific user
- `PUT /users/{user_id}/` - Update user
- `DELETE /users/{user_id}/` - Delete user

### Properties
- `GET /properties/` - List all properties
- `POST /properties/` - Create new property
- `GET /properties/{property_id}/` - Retrieve specific property
- `PUT /properties/{property_id}/` - Update property
- `DELETE /properties/{property_id}/` - Delete property

### Bookings
- `GET /bookings/` - List all bookings
- `POST /bookings/` - Create new booking
- `GET /bookings/{booking_id}/` - Retrieve specific booking
- `PUT /bookings/{booking_id}/` - Update booking
- `DELETE /bookings/{booking_id}/` - Delete booking

### Payments
- `POST /payments/` - Process payment

### Reviews
- `GET /reviews/` - List all reviews
- `POST /reviews/` - Create new review
- `GET /reviews/{review_id}/` - Retrieve specific review
- `PUT /reviews/{review_id}/` - Update review
- `DELETE /reviews/{review_id}/` - Delete review

## 👥 Team Roles
| Role | Responsibilities |
| :--- | :--- |
| **Backend Developer** | Implements API endpoints, business logic, data models, and third-party service integrations. |
| **Database Administrator (DBA)** | Designs and optimizes the database schema, manages migrations, and ensures data integrity and performance. |
| **DevOps Engineer** | Manages CI/CD pipelines, configures production infrastructure (servers, Docker), and ensures system reliability. |
| **QA Engineer** | Develops test plans, executes manual and automated tests, and identifies and tracks bugs. |
| **Product Owner** | Defines the project vision, manages the backlog, writes user stories, and prioritizes features for development. |
| **Scrum Master** | Facilitates Agile ceremonies, removes team impediments, and ensures a smooth workflow process. |
