# Travel Naja Car Rental Reservation System

This repository contains a full-stack car rental reservation system built as part of the Travel Naja platform.  It demonstrates a simple RESTful API backed by a MySQL database and a modern React/Tailwind frontend using shadcn/ui components.  The backend handles user authentication, car listings, bookings, cancellations, and staff reporting.

---

## 🚀 Project Overview

- **Domain**: Car rental reservations
- **Purpose**: Allow users to browse available cars, make reservations, view/cancel their bookings, and provide staff with an administrative dashboard and reports.
- **Architecture**: Split into two main implementations:
  - **Backend** (Node.js/Express) offers JSON APIs and connects to MySQL
  - **Frontend** (React + Vite + Tailwind + shadcn/ui) provides a SPA for customers and staff
  - Docker Compose is used for running the database locally.

---

## 🧱 Tech Stack

| Layer     | Technology                                      |
|-----------|-------------------------------------------------|
| Frontend  | React, Vite, Tailwind CSS (v3), shadcn/ui       |
| Backend   | Node.js (>=20), Express, JWT, bcrypt            |
| Database  | MySQL (dockerized via `docker-compose`)         |
| Dev Ops   | Docker, Git                                     |

---

## ✅ Prerequisites

Make sure you have the following installed:

- Node.js **v20 or later**
- Docker (for MySQL service)
- Git (for cloning the repo)

---

## 🛠️ Build & Run Instructions

```bash
# 1. clone the repository
git clone https://github.com/earthslipz/Jiancha-Travel-Reservation-System-focus-on-car-rental-reservation-.git
cd Jiancha-Travel-Reservation-System-focus-on-car-rental-reservation-

# 2. start the database
docker compose up -d

# 3. start the backend
cd implementations/backend
cp .env.example .env          # configure your DB credentials if needed
npm install
npm run dev

# 4. start the frontend
cd ../frontend
npm install
npm run dev
```

### ⚠️ Codespace Warning
If you are running this project inside a **GitHub Codespace**, after starting the backend:

1. Open the **PORTS** tab in the Codespace UI.
2. Right‑click on port **8080** and set **Visibility → Public**.

Otherwise, the frontend won't be able to reach the backend because of tunnel authentication.

---

## 🔌 Default Ports

- Backend API: http://localhost:8080
- Frontend app: http://localhost:5173

---

## 📡 API Endpoints

| Method | Endpoint                             | Auth Required | Description                                      |
|--------|--------------------------------------|---------------|--------------------------------------------------|
| POST   | `/api/auth/register`                 | No            | Create a new member account                      |
| POST   | `/api/auth/login`                    | No            | Authenticate and receive JWT                     |
| GET    | `/api/cars`                          | No            | List available cars (query: `?location=&type=`)  |
| GET    | `/api/cars/:id`                      | No            | Get details for a single car                     |
| GET    | `/api/bookings`                      | Yes (member)  | Retrieve bookings for the logged‑in user        |
| POST   | `/api/bookings`                      | Yes (member)  | Create a new booking                             |
| DELETE | `/api/bookings/:id`                  | Yes (member)  | Cancel a booking owned by the user               |
| GET    | `/api/staff/dashboard`               | Yes (staff)   | Overview stats for staff (bookings, revenue)    |
| GET    | `/api/staff/reports/reservations`    | Yes (staff)   | Full reservation report for staff                |

*All authenticated endpoints require a bearer JWT in the `Authorization` header.*

---

## 🧪 Test Accounts

You can register new users via the frontend or API.  The database has a `role` field (`member` or `staff`).  To create a staff user manually after registration:

```sql
UPDATE users SET role = 'staff' WHERE email = 'you@example.com';
```

### Example credentials

| Role   | Email                | Password |
|--------|----------------------|----------|
| member | member@example.com   | password |
| staff  | staff@example.com    | password |

*(Insert or update these records directly in the `users` table.)*

---

## ⚙️ Running Backend Tests

```bash
cd implementations/backend
npm test
```

Tests are written with Jest and cover authentication and booking logic.

---

## 📁 Repository Structure

```plain
.
├── docker-compose.yml           # MySQL service definition
├── implementations
│   ├── backend
│   │   ├── src
│   │   │   ├── controllers
│   │   │   ├── database
│   │   │   ├── middleware
│   │   │   ├── routes
│   │   │   └── app.js
│   │   ├── tests
│   │   ├── package.json
│   │   └── jest.config.js
│   └── frontend
│       ├── public
│       ├── src
│       │   ├── components
│       │   ├── pages
│       │   ├── services
│       │   └── App.jsx
│       ├── package.json
│       └── tailwind.config.js
└── README.md                    # ← you are here
```

---

## 🎯 Notes

- The service is intentionally minimal and structured for educational/demo purposes.
- Feel free to extend with hotels, flights, or other Travel Naja modules.

Happy coding! 🚗💨
