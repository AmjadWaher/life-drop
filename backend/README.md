# LifeDrop

> A real-time blood donation backend API that connects hospitals with compatible donors in Jordan using role-based access, district-level targeting, quota-safe request acceptance, SignalR live updates, and Firebase push notifications.

![.NET](https://img.shields.io/badge/.NET-10.0-512BD4?logo=dotnet)
![Database](https://img.shields.io/badge/database-PostgreSQL-336791?logo=postgresql)
![Architecture](https://img.shields.io/badge/architecture-Clean%20Architecture-blue)
![Build](https://img.shields.io/badge/build-passing-brightgreen)

---

## Table of Contents

- [LifeDrop](#lifedrop)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Architecture](#architecture)
  - [Tech Stack](#tech-stack)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Using Docker](#using-docker)
  - [Environment Variables](#environment-variables)
  - [Usage](#usage)
  - [API Documentation](#api-documentation)
    - [Authentication](#authentication)
    - [Donors](#donors)
    - [Donation Requests](#donation-requests)
    - [Hospitals and Admin](#hospitals-and-admin)
    - [Reference Data, Locations, and Notifications](#reference-data-locations-and-notifications)
    - [Response Format](#response-format)
  - [Testing](#testing)
  - [Contributing](#contributing)

---

## Overview

LifeDrop is a RESTful backend API for a blood donation management platform. It is designed to reduce the delay between a hospital needing blood and a compatible donor being notified.

The system is built for four main user roles:

- `SystemAdmin`: manages hospitals and platform-level operations.
- `HospitalAdmin`: manages a verified hospital and its employees.
- `HospitalEmployee`: creates donation requests, tracks acceptances, verifies arrivals, and confirms successful donations.
- `Donor`: receives compatible requests, accepts requests, tracks eligibility, and earns gamification points.

Key capabilities:

- Donor registration with OTP verification.
- JWT authentication with refresh token rotation.
- Hospital and employee management.
- Donation request creation with blood type, urgency, expiry date, quota, and targeted districts.
- Donor feed filtered by location, blood compatibility, verification state, and cooldown status.
- Optimistic concurrency on donation quotas to prevent over-acceptance.
- SignalR real-time notifications for active clients.
- Firebase Cloud Messaging for offline push notifications.
- No-show timeout handling and donor reliability penalties.
- Gamification points, leaderboard, donation history, and PDF certificates.
- Structured logging, rate limiting, health checks, and response compression.

LifeDrop intentionally uses structured location selection only: Governorate -> District. It does not use active GPS tracking, background location polling, or custom proximity algorithms.

---

## Architecture

This project follows Clean Architecture with a five-project .NET solution:

```text
LifeDrop/
├── Core/                     # Domain layer
│   ├── Entities/             # User, DonorProfile, Hospital, DonationRequest, etc.
│   ├── Enums/                # Roles, blood types, request status, urgency
│   ├── Events/               # Domain events
│   ├── Common/               # Result, Error, BaseEntity
│   └── Helpers/              # Blood compatibility and domain helpers
│
├── Services/                 # Application layer
│   ├── Features/             # CQRS commands, queries, handlers, validators
│   ├── Behaviors/            # MediatR pipeline behaviors
│   ├── Interfaces/           # Application contracts
│   └── Abstractions/         # Repository and unit-of-work abstractions
│
├── infrastructure/           # Infrastructure layer
│   ├── Data/                 # AppDbContext and EF Core configuration
│   ├── Repositories/         # Repository and unit-of-work implementations
│   ├── Security/             # JWT generation and password hashing
│   ├── Services/             # Email, Firebase, PDF, OTP services
│   └── Migrations/           # EF Core migrations
│
├── Api/                      # Presentation layer
│   ├── Controllers/          # HTTP endpoints
│   ├── Hubs/                 # SignalR DonationHub
│   ├── Middleware/           # Exception handling and status pages
│   ├── BackgroundWorkers/    # Timeout and outbox workers
│   ├── Extensions/           # Auth, Swagger, rate limiting, DI setup
│   └── Program.cs            # API entrypoint
│
└── Shared/                   # Shared DTOs and response contracts
```

Dependency direction:

```text
Api -> Services -> Core
Api -> infrastructure -> Services/Core
Shared is used for cross-layer DTOs and payloads.
```

Main architectural patterns:

- Clean Architecture for layer separation.
- CQRS with MediatR for commands and queries.
- Repository and Unit of Work for data access abstraction.
- Result Pattern for explicit success/failure handling.
- Outbox Pattern for reliable event dispatch.
- Idempotency keys for duplicate-safe command execution.
- Optimistic concurrency using PostgreSQL `xmin` on donation requests.
- Direct inline mapping and LINQ projections. AutoMapper is not used.

---

## Tech Stack

| Layer               | Technology                                 |
| ------------------- | ------------------------------------------ |
| Framework           | ASP.NET Core 10 / .NET 10                  |
| Language            | C# 13                                      |
| ORM                 | Entity Framework Core 10                   |
| Database            | PostgreSQL 16 hosted on Neon               |
| PostgreSQL Provider | Npgsql.EntityFrameworkCore.PostgreSQL      |
| CQRS                | MediatR 14                                 |
| Validation          | FluentValidation                           |
| Authentication      | Custom JWT Bearer + refresh token rotation |
| Password Hashing    | BCrypt.Net-Next                            |
| Real-Time           | SignalR                                    |
| Push Notifications  | Firebase Cloud Messaging                   |
| Caching             | HybridCache with Redis support             |
| Email               | MailKit via Brevo SMTP                     |
| PDF Generation      | QuestPDF                                   |
| Logging             | Serilog                                    |
| API Docs            | Swagger / OpenAPI via Swashbuckle          |
| Rate Limiting       | ASP.NET Core Rate Limiting                 |
| Containerization    | Dockerfile included                        |
| Automated Tests     | Not currently included                     |

---

## Getting Started

### Prerequisites

- [.NET 10 SDK](https://dotnet.microsoft.com/download)
- PostgreSQL database, preferably Neon PostgreSQL
- Redis instance for distributed cache support
- Firebase project/service account for push notifications
- SMTP provider credentials, such as Brevo
- Docker, optional
- Visual Studio 2022, JetBrains Rider, or VS Code with C# tooling

### Installation

1. Clone the repository:

```bash
git clone <repository-url>
cd LifeDrop
```

2. Restore dependencies:

```bash
dotnet restore LifeDrop/LifeDrop.sln
```

3. Configure secrets in environment variables or `LifeDrop/Api/appsettings.Development.json`.

4. Apply database migrations from the API project:

```bash
cd LifeDrop/Api
dotnet ef database update --project ../infrastructure/infrastructure.csproj --startup-project .
```

5. Run the API from the repository root:

```bash
dotnet run --project LifeDrop/Api/Api.csproj
```

6. Build the full solution:

```bash
dotnet build LifeDrop/LifeDrop.sln
```

### Using Docker

The repository includes a `Dockerfile` that builds and publishes the API with .NET 10.

```bash
docker build -t lifedrop-api .
docker run -p 8080:8080 --env-file .env lifedrop-api
```

The container exposes the API on port `8080` and includes a health check at `/health`.

---

## Environment Variables

Do not commit production secrets. Use environment variables, user secrets, or a secret manager for deployment.

Recommended configuration shape:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Host=...;Database=...;Username=...;Password=...;SSL Mode=Require;",
    "Redis": "localhost:6379"
  },
  "Jwt": {
    "SecretKey": "replace-with-a-strong-secret-key",
    "Issuer": "LifeDrop.Api",
    "Audience": "LifeDrop.Client",
    "ExpirationInMinutes": 60,
    "RefreshTokenExpirationDays": 7
  },
  "BootstrapSecret": "replace-with-bootstrap-secret",
  "DonationSettings": {
    "CooldownDays": 90,
    "PointsPerDonation": 50,
    "ReliabilityPenaltyPerNoShow": 10.0,
    "AcceptanceTimeoutHours": 2
  },
  "EmailSettings": {
    "SmtpServer": "smtp-relay.example.com",
    "Port": 2525,
    "SenderName": "LifeDrop",
    "SenderEmail": "no-reply@example.com",
    "Username": "smtp-username",
    "Password": "smtp-password"
  },
  "Firebase": {
    "ServiceAccountJson": "{...}"
  }
}
```

| Variable                                        | Description                                     | Required          |
| ----------------------------------------------- | ----------------------------------------------- | ----------------- |
| `ConnectionStrings__DefaultConnection`          | PostgreSQL connection string                    | Yes               |
| `ConnectionStrings__Redis`                      | Redis connection string                         | Recommended       |
| `Jwt__SecretKey`                                | JWT HMAC signing key                            | Yes               |
| `Jwt__Issuer`                                   | JWT issuer                                      | Yes               |
| `Jwt__Audience`                                 | JWT audience                                    | Yes               |
| `Jwt__ExpirationInMinutes`                      | Access token lifetime                           | No                |
| `Jwt__RefreshTokenExpirationDays`               | Refresh token lifetime                          | No                |
| `BootstrapSecret`                               | Secret used to create the first system admin    | Yes for bootstrap |
| `DonationSettings__CooldownDays`                | Donor post-donation cooldown period             | No                |
| `DonationSettings__PointsPerDonation`           | Points awarded per fulfilled donation           | No                |
| `DonationSettings__ReliabilityPenaltyPerNoShow` | Reliability penalty for no-shows                | No                |
| `DonationSettings__AcceptanceTimeoutHours`      | Time before accepted requests expire as no-show | No                |
| `EmailSettings__SmtpServer`                     | SMTP host                                       | Yes for OTP/email |
| `EmailSettings__Port`                           | SMTP port                                       | Yes for OTP/email |
| `EmailSettings__SenderEmail`                    | Sender email address                            | Yes for OTP/email |
| `EmailSettings__Username`                       | SMTP username                                   | Yes for OTP/email |
| `EmailSettings__Password`                       | SMTP password                                   | Yes for OTP/email |
| `Firebase__ServiceAccountJson`                  | Firebase Admin SDK service account JSON         | Yes for FCM       |

---

## Usage

When running in Development, Swagger is available at:

```text
/swagger
```

Health check endpoint:

```text
/health
```

SignalR hub:

```text
/hubs/donations
```

Authentication flow:

1. Create the first system admin with `POST /api/auth/bootstrap` using the bootstrap secret.
2. Login with `POST /api/auth/login`.
3. Copy the returned access token.
4. Send protected API requests with `Authorization: Bearer <token>`.
5. Use `POST /api/auth/refresh` to rotate refresh tokens and issue a new access token.

Example request to create a donation request:

```http
POST /api/donationrequests
Authorization: Bearer <hospital-employee-token>
Content-Type: application/json

{
  "bloodType": "O_Positive",
  "urgency": "Critical",
  "targetQuota": 3,
  "expiryDate": "2026-05-25T00:00:00Z",
  "districtIds": ["00000000-0000-0000-0000-000000000000"],
  "notes": "Urgent need for ICU patient"
}
```

Example request to accept a donation request:

```http
POST /api/donationrequests/{requestId}/accept
Authorization: Bearer <donor-token>
X-Idempotency-Key: <client-generated-uuid>
```

---

## API Documentation

### Authentication

| Method | Endpoint                    | Description                                     | Auth |
| ------ | --------------------------- | ----------------------------------------------- | ---- |
| `POST` | `/api/auth/bootstrap`       | Create the first system admin                   | No   |
| `POST` | `/api/auth/login`           | Login and receive access/refresh tokens         | No   |
| `POST` | `/api/auth/refresh`         | Rotate refresh token and issue new access token | No   |
| `POST` | `/api/auth/forgot-password` | Send password reset OTP                         | No   |
| `POST` | `/api/auth/verify-otp`      | Verify reset OTP                                | No   |
| `POST` | `/api/auth/reset-password`  | Reset password after OTP verification           | No   |
| `POST` | `/api/auth/resend-otp`      | Resend password reset OTP                       | No   |

### Donors

| Method | Endpoint                              | Description                           | Auth             |
| ------ | ------------------------------------- | ------------------------------------- | ---------------- |
| `POST` | `/api/donors/register`                | Start donor registration and send OTP | No               |
| `POST` | `/api/donors/verify-registration`     | Complete donor registration           | No               |
| `POST` | `/api/donors/resend-registration-otp` | Resend registration OTP               | No               |
| `POST` | `/api/donors/verify`                  | Hospital verifies donor blood type    | HospitalEmployee |
| `GET`  | `/api/donors/leaderboard`             | Get donor leaderboard                 | No               |
| `GET`  | `/api/donors/me/gamification-history` | Get donor point history               | Donor            |
| `GET`  | `/api/donors/me/cooldown`             | Get donor cooldown status             | Donor            |

### Donation Requests

| Method | Endpoint                                              | Description                          | Auth             |
| ------ | ----------------------------------------------------- | ------------------------------------ | ---------------- |
| `POST` | `/api/donationrequests`                               | Create donation request              | HospitalEmployee |
| `GET`  | `/api/donationrequests/feed`                          | Get personalized donor feed          | Donor            |
| `GET`  | `/api/donationrequests/browse`                        | Browse active requests               | Donor            |
| `GET`  | `/api/donationrequests/active`                        | Get donor active commitment          | Donor            |
| `POST` | `/api/donationrequests/{requestId}/accept`            | Accept request using idempotency key | Donor            |
| `GET`  | `/api/donationrequests/{requestId}/details`           | Get donor-facing request details     | Donor            |
| `GET`  | `/api/donationrequests`                               | Get hospital requests                | HospitalEmployee |
| `GET`  | `/api/donationrequests/{requestId}`                   | Get hospital request details         | HospitalEmployee |
| `POST` | `/api/donationrequests/acceptances/{id}/fulfill`      | Mark donation as fulfilled           | HospitalEmployee |
| `POST` | `/api/donationrequests/acceptances/{id}/no-show`      | Mark donor as no-show                | HospitalEmployee |
| `POST` | `/api/donationrequests/{requestId}/cancel`            | Cancel hospital request              | HospitalEmployee |
| `POST` | `/api/donationrequests/{requestId}/cancel-acceptance` | Donor cancels own acceptance         | Donor            |
| `GET`  | `/api/donationrequests/{requestId}/certificate`       | Download donation certificate PDF    | Donor            |

### Hospitals and Admin

| Method  | Endpoint                                         | Description                      | Auth             |
| ------- | ------------------------------------------------ | -------------------------------- | ---------------- |
| `GET`   | `/api/hospitals/me`                              | Get current hospital profile     | HospitalEmployee |
| `PUT`   | `/api/hospitals/profile`                         | Update hospital profile          | HospitalAdmin    |
| `GET`   | `/api/hospitals/dashboard/overview`              | Get hospital dashboard overview  | HospitalEmployee |
| `GET`   | `/api/hospitals/analytics`                       | Get hospital analytics           | HospitalEmployee |
| `GET`   | `/api/hospitals/donors/communication`            | Get donor communication list     | HospitalEmployee |
| `GET`   | `/api/hospitals/employees`                       | List hospital employees          | HospitalAdmin    |
| `GET`   | `/api/hospitals/employees/{id}`                  | Get hospital employee details    | HospitalAdmin    |
| `POST`  | `/api/hospitals`                                 | Create hospital                  | SystemAdmin      |
| `POST`  | `/api/hospitals/admin`                           | Create hospital admin            | SystemAdmin      |
| `POST`  | `/api/hospitals/employee`                        | Create hospital employee         | HospitalAdmin    |
| `GET`   | `/api/admin/hospitals`                           | List hospitals                   | SystemAdmin      |
| `GET`   | `/api/admin/hospitals/{id}/employees`            | List hospital employees as admin | SystemAdmin      |
| `PATCH` | `/api/admin/hospitals/{id}/activate`             | Activate hospital                | SystemAdmin      |
| `PATCH` | `/api/admin/hospitals/{id}/deactivate`           | Deactivate hospital              | SystemAdmin      |
| `PATCH` | `/api/admin/hospitals/employees/{id}/activate`   | Activate employee                | SystemAdmin      |
| `PATCH` | `/api/admin/hospitals/employees/{id}/deactivate` | Deactivate employee              | SystemAdmin      |
| `GET`   | `/api/admin/operations`                          | Get platform operations metrics  | SystemAdmin      |

### Reference Data, Locations, and Notifications

| Area                      | Description                                                        |
| ------------------------- | ------------------------------------------------------------------ |
| `LocationsController`     | Governorates and districts used for explicit location selection    |
| `ReferenceDataController` | Blood types, urgency levels, status values, and lookup data        |
| `NotificationsController` | Device token registration and notification-related operations      |
| `DonationHub`             | SignalR real-time donor request notifications at `/hubs/donations` |

### Response Format

Successful responses use the project response wrapper:

```json
{
  "code": 200,
  "message": "Success",
  "data": {}
}
```

Expected business failures are represented with the project `Result<T>` pattern and mapped to proper HTTP status codes:

| Error Type   | HTTP Status        |
| ------------ | ------------------ |
| Validation   | `400 Bad Request`  |
| Failure      | `400 Bad Request`  |
| Unauthorized | `401 Unauthorized` |
| NotFound     | `404 Not Found`    |
| Conflict     | `409 Conflict`     |

---

## Testing

This repository currently does not include automated test projects, even though the architecture is designed to support unit and integration testing.

Current verification approach documented in the project:

- Manual API testing through Swagger and Postman.
- Integration checks against PostgreSQL/Neon.
- Performance observation through Serilog and the MediatR performance behavior.
- Manual validation of authentication, OTP, quota overflow, duplicate acceptance, cooldown, and authorization scenarios.

Recommended future test setup:

```text
tests/
├── LifeDrop.UnitTests/         # Handlers, validators, domain logic
├── LifeDrop.IntegrationTests/  # API and database integration tests
└── LifeDrop.ArchTests/         # Clean Architecture dependency rules
```

Future commands after test projects are added:

```bash
dotnet test LifeDrop/LifeDrop.sln
dotnet test LifeDrop/LifeDrop.sln --collect:"XPlat Code Coverage"
```

---

## Contributing

1. Create a feature branch:

```bash
git checkout -b feature/your-feature-name
```

2. Keep changes aligned with the project architecture:

- Put domain entities, enums, and domain events in `Core`.
- Put CQRS commands, queries, handlers, and validators in `Services`.
- Put EF Core, repositories, external integrations, and security services in `infrastructure`.
- Put controllers, middleware, hubs, and hosted workers in `Api`.
- Use inline object initializers for command/write mapping.
- Use LINQ `Select` projections for read/query DTOs.
- Do not introduce AutoMapper, extension-method mapping, or DDD static factory mapping.

3. Build before submitting:

```bash
dotnet build LifeDrop/LifeDrop.sln
```

4. Use clear commit messages, preferably Conventional Commits:

```bash
git commit -m "feat: add donor availability endpoint"
```
