# Smart Blood Inventory & Temperature Monitoring System

## Architecture Explanation Document

### Project Overview

The Smart Blood Inventory & Temperature Monitoring System is a Laravel 11 REST API application developed to manage blood inventory, refrigerators, temperature monitoring, risk analysis, and dashboard reporting for blood banks.

The application follows a layered architecture using Controllers, Models, Form Requests, Events, Listeners, and API Routes.

---

## System Architecture

```text
Client (Postman)
       │
       ▼
API Routes
(routes/api.php)
       │
       ▼
Controllers
(AuthController,
BloodBagController,
RefrigeratorController,
TemperatureLogController,
DashboardController)
       │
       ▼
Form Requests
(Validation Layer)
       │
       ▼
Models
(Eloquent ORM)
       │
       ▼
MySQL Database
```

---

## Authentication Layer

Authentication is implemented using Laravel Sanctum.

### Flow

```text
User Login
     │
     ▼
Sanctum Token Generated
     │
     ▼
Bearer Token
     │
     ▼
Protected APIs
```

### APIs

```http
POST /api/login
POST /api/logout
```

---

## Database Design

### Users

```text
id
name
email
password
role
```

### Blood Banks

```text
id
name
location
```

### Refrigerators

```text
id
blood_bank_id
name
code
status
```

### Blood Bags

```text
id
refrigerator_id
bag_number
blood_group
donor_name
collection_date
expiry_date
quantity_ml
status
```

### Temperature Logs

```text
id
refrigerator_id
temperature
logged_at
```

### Alerts

```text
id
refrigerator_id
type
message
temperature
alerted_at
```

---

## Relationships

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

## Temperature Monitoring Workflow

```text
Temperature Submitted
        │
        ▼
Temperature Log Created
        │
        ▼
Status Evaluation
        │
 ┌──────┼──────┐
 │      │      │
 ▼      ▼      ▼
Safe  Warning Critical
                │
                ▼
Event Triggered
                │
                ▼
Listener Executed
                │
                ▼
Alert Created
```

### Temperature Rules

| Range      | Status   |
| ---------- | -------- |
| 2°C – 6°C  | Safe     |
| >6°C – 8°C | Warning  |
| >8°C       | Critical |

---

## Dashboard Analytics

Dashboard aggregates system information from multiple modules.

### Metrics

* Total Blood Bags
* Available Blood Stock
* Average Temperature
* Critical Alerts
* Expired Blood Bags
* Active Refrigerators
* Refrigerator Health Score

### API

```http
GET /api/dashboard
```

---

## Blood Expiry Monitoring

### APIs

```http
GET /api/blood-bags-expiring
GET /api/expired-blood-bags
GET /api/near-risk-percentage
```

### Purpose

* Identify blood bags nearing expiry
* Track expired inventory
* Calculate inventory risk percentage

---

## Laravel Features Used

### Authentication

```text
Laravel Sanctum
```

### Validation

```text
Form Requests
```

### ORM

```text
Eloquent Models
Relationships
```

### Optimization

```text
with()
withCount()
```

### Event Driven Architecture

```text
Events
Listeners
```

### API Development

```text
REST APIs
JSON Responses
```

---

## Conclusion

The system provides secure blood inventory management, refrigerator monitoring, temperature tracking, automatic alert generation, risk analysis, and dashboard reporting using Laravel 11 best practices.
