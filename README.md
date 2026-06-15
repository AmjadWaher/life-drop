# 🩸 LifeDrop

**LifeDrop** is a blood donation management system that connects donors with hospitals and donation centers. The platform consists of three components: a backend API, a web dashboard for hospital staff, and a mobile app for donors.

---

## 📦 Components

| Component | Tech | Status | README |
|-----------|------|--------|--------|
| 🖥️ Backend API | ASP.NET Core (.NET 10) | ✅ Deployed | [View README](./backend/README.md) |
| 🌐 Hospital Dashboard | HTML, CSS, JavaScript | ✅ Implemented | [View README](life-drop/hospital_dashboard/LifeDrop-Web/README.md) |
| 📱 Donor App | Flutter | ✅ Implemented | [View README](./donor_app/README.md) |

---

## 🏗️ Repository Structure

```
life-drop/
├── backend/                # ASP.NET Core API
│   └── README.md
├── donor_app/              # Flutter mobile application
│   └── README.md
├── hospital_dashboard/     # HTML/CSS/JS web dashboard
│   └── README.md
└── README.md               # ← You are here
```

---

## 🔗 System Architecture

```
┌─────────────────────┐        REST + JWT       ┌──────────────────────┐
│     Donor App       │◄───────────────────────►│    Backend API       │
│     (Flutter)       │                          │  (ASP.NET Core)      │
└─────────────────────┘                          └──────────┬───────────┘
                                                            │
┌─────────────────────┐        REST + JWT                  │
│  Hospital Dashboard │◄──────────────────────────────────►│
│  (HTML / CSS / JS)  │                                     │
└─────────────────────┘                          ┌──────────▼───────────┐
                                                 │   Firebase (FCM)     │
                                                 │   Crashlytics        │
                                                 └──────────────────────┘
```

- All components communicate with the backend via **REST API + JWT**
- Realtime updates via **SignalR** hub at `/hubs/donations`
- Push notifications via **Firebase Cloud Messaging**

---

## 🚀 Deployment

| Component | Platform |
|-----------|----------|
| Backend API | [Render](https://render.com) — `https://lifedrop-vh2h.onrender.com/api` |
| Hospital Dashboard | Static hosting (Vercel / Netlify) |
| Donor App (Android) | Google Play / Firebase App Distribution |
| Donor App (iOS) | Apple App Store |

---

## 🔐 Security Highlights

- HTTPS enforced across all environments
- JWT access + refresh token flow
- Secure token storage on mobile (`flutter_secure_storage`)
- Firebase Crashlytics for crash monitoring

---

*Built with ❤️ to save lives — LifeDrop © 2026*
