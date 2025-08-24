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
### Role	Responsibilities
**Backend Developer**	Implements API endpoints, business logic, data models, and third-party service integrations.  
**Database Administrator (DBA)**	Designs and optimizes the database schema, manages migrations, and ensures data integrity and performance.  
**DevOps Engineer**	Manages CI/CD pipelines, configures production infrastructure (servers, Docker), and ensures system reliability.  
**QA Engineer**	Develops test plans, executes manual and automated tests, and identifies and tracks bugs.  
**Product Owner**	Defines the project vision, manages the backlog, writes user stories, and prioritizes features for development.  
**Scrum Master**	Facilitates Agile ceremonies, removes team impediments, and ensures a smooth workflow process.  
