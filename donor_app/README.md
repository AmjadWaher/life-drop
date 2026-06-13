# 💉 LifeDrop Donor App

> A Flutter mobile application for blood donors — built for fast, reliable response during emergency blood donation cases.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey)

---

## 📖 Description

**LifeDrop Donor App** helps blood donors register, manage their profile, and respond to emergency donation requests in real time. It supports push notifications, real-time updates via SignalR, biometric authentication, multilingual support, and more — all built on a clean, scalable Flutter architecture.

---

## ✨ Features

- 🩸 Browse and accept blood donation requests
- 📋 View request details with urgency and hospital info
- 📍 Location support and hospital navigation
- 🔔 Push notifications with real-time SignalR updates
- 🕓 Donation history and cooldown tracking
- 📜 Donation certificate download
- 🔐 Biometric authentication support
- 🌙 Light, dark, and system theme support
- 🌍 Arabic and English localization
- 📵 Offline / disconnected state handling
- 🔑 Secure token storage and OTP verification

---

## 🛠️ Tech Stack

| Category | Technologies |
|---|---|
| Framework | Flutter, Dart |
| Architecture | Clean Architecture |
| State Management | Bloc / Cubit (`flutter_bloc`, Equatable) |
| Networking | Dio, Retrofit |
| Real-time | SignalR |
| Dependency Injection | get_it |
| Firebase | Core, Cloud Messaging, Crashlytics |
| Storage | Shared Preferences, Flutter Secure Storage |
| Location | Geolocator, Geocoding |
| UI | Flutter ScreenUtil, Flutter SVG, Cached Network Images |
| Auth | Local Authentication / Biometrics |
| i18n | Flutter Localizations (AR / EN) |
| Code Generation | Freezed, JSON Serializable, build_runner |

---

## ⚙️ Installation

1. **Install Flutter and Dart**
   - Follow the [official Flutter installation guide](https://docs.flutter.dev/get-started/install)

2. **Clone the repository and navigate to the project:**
   ```bash
   git clone <your-repo-url>
   cd donor_app
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Add Firebase configuration files:**
   - Place `google-services.json` in `android/app/` for Android
   - Place `GoogleService-Info.plist` in `ios/Runner/` for iOS

5. **Generate code (when models or generated files need updating):**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

6. **Connect an emulator or physical device.**

---

## 🚀 Usage

**Run in development:**
```bash
flutter run -t lib/main_development.dart
```

**Run in production:**
```bash
flutter run -t lib/main_production.dart
```

**Build Android APK:**
```bash
flutter build apk -t lib/main_production.dart
```

**Run tests:**
```bash
flutter test
```

---

## 🔧 Environment Variables

No `.env` file is required. Configuration is passed via `--dart-define`:

```bash
flutter run -t lib/main_production.dart \
  --dart-define=API_BASE_URL=https://your-api-url.com \
  --dart-define=REALTIME_BASE_URL=https://your-realtime-url.com
```

| Variable | Description |
|---|---|
| `API_BASE_URL` | REST API base URL |
| `REALTIME_BASE_URL` | SignalR base URL |

> SignalR hub endpoint: `${REALTIME_BASE_URL}/hubs/donations`

Firebase is configured via the platform-specific config files (see Installation step 4).

---

## 📁 Project Structure

```
lib/
├── core/
│   ├── di/                         # Dependency injection (get_it)
│   ├── entities/                   # Shared entities (districts, governorate)
│   ├── enums/                      # App-wide enums (blood type, donation status...)
│   ├── helpers/                    # Utilities (regex, biometric, location, validation...)
│   ├── logic/                      # Core cubits (biometric, language, theme)
│   ├── mixins/                     # Reusable mixins (API call, snack bar)
│   ├── models/                     # Shared data models
│   ├── networking/                 # Dio, Retrofit, API constants & error handling
│   ├── resources/                  # Image paths
│   ├── routing/                    # App router and route names
│   ├── themes/                     # Colors, text styles, theme config
│   └── widgets/                    # Shared reusable widgets
├── features/
│   ├── all_requests/               # Browse all donation requests
│   ├── auth/                       # Login, register, OTP, forgot/reset password
│   ├── disconnected/               # No internet screen
│   ├── donation_history/           # Past donations list
│   ├── donation_request/           # Request details & acceptance
│   ├── home/                       # Dashboard & summary
│   ├── notifications/              # FCM device token management
│   ├── onboarding/                 # Onboarding flow
│   ├── profile/                    # Profile, edit, settings (language, theme, account)
│   ├── realtime/                   # SignalR hub service & cubit
│   ├── requests/                   # Active donation, cancel, certificate download
│   └── splash/                     # Splash screen
├── l10n/                           # Localization files (AR / EN)
├── app.dart                        # App widget
├── main_development.dart           # Dev entry point
└── main_production.dart            # Production entry point
```

> Each feature follows **Clean Architecture**: `data/` → `domain/` → `presentation/`

---

## 🤝 Contributing

Contributions are welcome! Please follow these architecture guidelines:

- Keep business logic **out of widgets**
- Place API calls inside **remote data sources**
- Use **repositories** for data abstraction
- Use **Cubits with typed states** for feature state management
- Register all dependencies with **get_it**
- Keep widgets **small, reusable, and responsive**
- Reuse helpers and shared components from `core/`

---

## 🙏 Acknowledgements

- [Flutter](https://flutter.dev) & [Dart](https://dart.dev)
- [Firebase](https://firebase.google.com)
- [Dio](https://pub.dev/packages/dio) & [Retrofit](https://pub.dev/packages/retrofit)
- [Bloc / Cubit](https://bloclibrary.dev)
- [SignalR](https://learn.microsoft.com/en-us/aspnet/signalr/)
- [get_it](https://pub.dev/packages/get_it)
- [Freezed](https://pub.dev/packages/freezed) & [JSON Serializable](https://pub.dev/packages/json_serializable)
