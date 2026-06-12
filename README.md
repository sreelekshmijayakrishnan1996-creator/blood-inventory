# Smart Blood Inventory & Temperature Monitoring System

## Project Overview

Smart Blood Inventory & Temperature Monitoring System is a Laravel 11 REST API application designed to manage blood inventory, refrigerator monitoring, temperature tracking, risk analysis, and dashboard analytics for blood banks.

The system provides secure authentication using Laravel Sanctum and supports blood bag management, refrigerator management, temperature monitoring, critical alert generation, and inventory analysis.

---

## Technologies Used

* Laravel 11
* PHP 8.2+
* MySQL
* Laravel Sanctum
* Postman
* REST API

---

## Features Implemented

### Authentication & Authorization

* Laravel Sanctum Authentication
* Login API
* Logout API
* Protected Routes
* Token-Based Authentication
* Role Support (Admin, Staff)

### Blood Bank Management

* Blood Bank Model
* Blood Bank Relationship Management

### Refrigerator Management

* Create Refrigerator
* View Refrigerator
* Update Refrigerator
* Delete Refrigerator

### Blood Bag Management

* Create Blood Bag
* View Blood Bags
* Update Blood Bags
* Delete Blood Bags

### Temperature Monitoring

* Temperature Logging
* Safe Temperature Detection
* Warning Temperature Detection
* Critical Temperature Detection

### Risk Analysis

* Daily Average Temperature
* Highest Temperature
* Lowest Temperature
* Total Unsafe Minutes
* Risk Percentage Calculation

### Dashboard Analytics

* Total Blood Bags
* Available Blood Stock by Group
* Critical Temperature Alerts
* Average Temperature Today
* Total Expired Bags
* Active Refrigerators
* Refrigerator Health Score

### Blood Expiry Monitoring

* Expiring Blood Bags API
* Expired Blood Bags API
* Near Risk Inventory Percentage API

### Advanced Laravel Concepts

* Eloquent Relationships
* Eager Loading
* withCount()
* Events
* Listeners
* Sanctum Authentication

---

## Database Relationships

### BloodBank

```php
hasMany(Refrigerator::class)
```

### Refrigerator

```php
belongsTo(BloodBank::class)
hasMany(BloodBag::class)
hasMany(TemperatureLog::class)
hasMany(Alert::class)
```

### BloodBag

```php
belongsTo(Refrigerator::class)
```

### TemperatureLog

```php
belongsTo(Refrigerator::class)
```

### Alert

```php
belongsTo(Refrigerator::class)
```

---

## Temperature Logic

| Temperature Range | Status   |
| ----------------- | -------- |
| 2°C - 6°C         | Safe     |
| > 6°C - 8°C       | Warning  |
| > 8°C             | Critical |

When the temperature exceeds 8°C, a CriticalTemperatureDetected Event is fired and handled by a Listener to generate alerts automatically.

---

## Risk Percentage Formula

```text
Risk Percentage = (Unsafe Minutes / Total Minutes) × 100
```

---

## API Endpoints

### Authentication

#### Login

```http
POST /api/login
```

#### Logout

```http
POST /api/logout
```

---

### Refrigerators

```http
GET    /api/refrigerators
POST   /api/refrigerators
GET    /api/refrigerators/{id}
PUT    /api/refrigerators/{id}
DELETE /api/refrigerators/{id}
```

---

### Blood Bags

```http
GET    /api/blood-bags
POST   /api/blood-bags
GET    /api/blood-bags/{id}
PUT    /api/blood-bags/{id}
DELETE /api/blood-bags/{id}
```

---

### Temperature Monitoring

```http
POST /api/temperature-logs
GET  /api/temperature-analysis/{refrigerator_id}
```

---

### Dashboard

```http
GET /api/dashboard
```

---

### Blood Expiry

```http
GET /api/blood-bags-expiring
GET /api/expired-blood-bags
GET /api/near-risk-percentage
```

---

## Setup Instructions

### Clone Repository

```bash
git clone <repository-url>
cd blood-inventory
```

### Install Dependencies

```bash
composer install
```

### Create Environment File

```bash
cp .env.example .env
```

### Generate Application Key

```bash
php artisan key:generate
```

### Configure Database

Update `.env` file:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=blood_inventory
DB_USERNAME=root
DB_PASSWORD=
```

### Run Migrations

```bash
php artisan migrate
```

### Start Development Server

```bash
php artisan serve
```

---

## Default Admin Credentials

```text
Email    : admin@gmail.com
Password : Admin@123
```

---

## Postman Documentation

Import the provided Postman Collection:

```text
Smart_Blood_Inventory_API.postman_collection.json
```

Use the Login API to generate a Sanctum token and pass it as a Bearer Token for all protected APIs.

---

## Project Structure

```text
app
├── Models
├── Events
├── Listeners
├── Http
│   ├── Controllers
│   └── Requests
├── Providers
routes
database
```

---

## Assessment Requirements Covered

✔ Authentication & Authorization

✔ Blood Bag Management

✔ Refrigerator Management

✔ Temperature Monitoring

✔ Dashboard Analytics

✔ Expiry Prediction

✔ Eloquent Relationships

✔ Eager Loading

✔ withCount()

✔ Events & Listeners

✔ Sanctum Authentication

✔ REST API Development

✔ Risk Analysis Logic

✔ Clean Architecture

✔ Validation Handling

✔ Error Handling

---

## Author

Laravel Developer Assessment Submission

Smart Blood Inventory & Temperature Monitoring System
