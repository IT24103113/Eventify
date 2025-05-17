# Event Photography and Videography Booking System

## 📸 Project Overview

The **Event Photography and Videography Booking System** is a comprehensive web-based platform designed to connect clients with skilled photographers and videographers. The system streamlines the entire process—from discovering professionals, booking services, managing events, to collecting post-event feedback—while embracing robust Object-Oriented Programming (OOP) principles and file-based data storage.

---

## 📚 Table of Contents

- [Project Overview](#-project-overview)
- [Features](#-features)
- [System Architecture](#-system-architecture)
- [OOP Concepts by Component](#-oop-concepts-by-component)
- [Technologies Used](#-technologies-used)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Development Workflow](#-development-workflow)
- [License](#-license)

---

## ✨ Features

### For Clients
- Register, log in, and manage personal profiles
- Browse and search for professionals by service, rating, and availability
- Book photographers/videographers and track booking statuses
- View booking history and detailed event information
- Submit reviews and ratings after events

### For Professionals
- Register and manage professional profiles and service offerings
- Configure service types, pricing, and availability
- Receive and respond to booking requests
- View event schedules and client feedback

### For Administrators
- Centralized dashboard for system monitoring and management
- Oversee and manage user/professional accounts
- Approve or verify professional profiles
- Generate system reports and analytics
- Configure global system settings

---

## 🏗️ System Architecture

The application is organized into six main components, each utilizing key OOP concepts and the MVC (Model-View-Controller) design pattern:

1. **User Management**
   - Handles registration, authentication, and profile management with role-based access.
   - Data stored in `users.txt`.

2. **Professional Management**
   - Enables professionals to manage profiles and configure services.
   - Supports rating-based sorting of professionals.
   - Data stored in `photographers.txt`.

3. **Booking Management**
   - Implements queue-based booking for first-come, first-served logic.
   - Tracks booking status and lifecycle.
   - Data stored in `bookings.txt`.

4. **Admin Management**
   - Provides administrative controls and system operations.
   - Data stored in `admins.txt`.

5. **Feedback & Review**
   - Handles client reviews and professional rating calculations.
   - Data stored in `reviews.txt`.

6. **Event Management**
   - Supports event creation, configuration, and status management.

---

## 🧠 OOP Concepts by Component

Below is a summary of the main OOP concepts applied to each system component:

| Component             | OOP Concepts Used                                                                                           |
|-----------------------|------------------------------------------------------------------------------------------------------------|
| **User Management**         | **Encapsulation:** User attributes are private with getters/setters.<br>**Inheritance:** Base `User` class with `Client`, `Professional`, and `Admin` subclasses.<br>**Polymorphism:** Overriding login/registration logic for different user types.<br>**Abstraction:** Abstract methods for shared behaviors. |
| **Professional Management** | **Inheritance & Polymorphism:** `Professional` extends `User`, can override availability, service listing, etc.<br>**Encapsulation:** Profile data kept private.<br>**Polymorphism:** Methods overridden for displaying or updating professional info. |
| **Booking Management**      | **Encapsulation:** Booking details are private, accessed via methods.<br>**Polymorphism:** Handling bookings for different user roles.<br>**Abstraction:** Abstract booking handling for extensibility.<br>**MVC:** Controllers manage booking logic, models represent booking data. |
| **Admin Management**        | **Encapsulation:** Admin data is private.<br>**Inheritance:** `Admin` is a subclass of `User`.<br>**Singleton Pattern:** Ensures a single admin control instance for system configuration.<br>**MVC:** Admin controllers and views for system management. |
| **Feedback & Review**       | **Encapsulation:** Review content and ratings are private.<br>**Strategy Pattern:** Different algorithms for calculating ratings can be swapped easily.<br>**Polymorphism:** Different review processing for clients and professionals.<br>**MVC:** Models for reviews, controllers for processing. |
| **Event Management**        | **Builder Pattern:** Flexible event creation.<br>**Encapsulation:** Event details are private.<br>**State Pattern:** Managing event state (upcoming, ongoing, completed).<br>**MVC:** Controllers handle event logic, models represent events. |

> **Note:** MVC (Model-View-Controller) design pattern is used throughout the application to maintain separation of concerns and organize code effectively.

---

## 🛠️ Technologies Used

- **Backend:** Java (Servlets, JSP)
- **Frontend:** HTML, CSS, JavaScript, Bootstrap or Tailwind CSS
- **Data Storage:** File-based (`.txt` files)
- **IDE:** IntelliJ IDEA
- **Version Control:** Git (GitHub, feature branching workflow)

---

## 📁 Project Structure

The following structure demonstrates a modular organization for easier maintenance and scalability:

```
src/
├── main/
│   ├── java/
│   │   └── grp30/
│   │       └── eventify/
│   │           ├── controller/
│   │           ├── model/
│   │           └── service/
│   ├── resources/
│   └── webapp/
│       └── WEB-INF/
│           ├── views/
│           └── web.xml
└── test/
```

**Key Folders:**
- `controller/` — Handles HTTP requests and communication between UI and business logic.
- `model/` — Java classes representing core entities (User, Booking, Event, etc.).
- `service/` — Business logic for various system functionalities.
- `resources/` — Configuration files or static assets.
- `webapp/WEB-INF/views/` — JSP files for user interfaces.
- `web.xml` — Web application deployment descriptor.

---

## 🚀 Getting Started

### Prerequisites
- Java JDK 11 or newer
- IntelliJ IDEA (recommended) or any compatible Java IDE
- Git

### Setup Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/event-booking-system.git
   cd event-booking-system
   ```

2. **Open the Project in IntelliJ IDEA**
   - Go to `File` → `Open` and select the project folder.

3. **Configure the Project**
   - Set up the Java SDK and configure your servlet container (e.g., Tomcat).

4. **Build and Run**
   - Use Maven: `mvn clean install`
   - Or build via your IDE.
   - Deploy to Tomcat and access the application at `http://localhost:8080/`

---

## 🧑‍💻 Development Workflow

- Use `feature/*` branches for new features and `hotfix/*` for urgent fixes
- Submit pull requests for code review before merging into `main`
- Follow coding standards and document code with JavaDoc and clear comments

---

## 📃 License

This project is for educational purposes at [University Name].  
Licensed under the [MIT License](LICENSE).