# 📘 my_flutter_learn

A personal Flutter learning repository where I explore **Clean Architecture**, **scalable app structure**, modern Flutter tooling, and production-grade practices.

It is a continuously evolving learning workspace where I experiment, refactor, and improve my understanding of Flutter architecture and real-world application design.

---

## 🎯 Purpose of This Repository

This project exists to:

* ✅ Practice **Clean Architecture** concepts in Flutter
* ✅ Learn **feature-driven project structure**
* ✅ Experiment with **state management**, routing, networking, and DI
* ✅ Explore production-ready patterns (error handling, logging, security, etc.)
* ✅ Test and understand various Flutter packages and tooling
* ✅ Serve as my personal reference codebase across devices

This repository documents my ongoing learning journey and evolving understanding of Flutter architecture.

---

## 🙏 Attribution & Learning Credit

This project architecture was originally inspired by the excellent Flutter Template work from:

> **Momshad Dinury**
> GitHub: [https://github.com/momshaddinury/flutter_template](https://github.com/momshaddinury/flutter_template)

I initially followed his template to understand:

* Clean Architecture layering
* Folder structuring
* Dependency injection setup
* Scalable project organization

Over time, I have modified, refactored, added experiments, and adapted the structure to match my own learning goals.

⚠️ **Important:**
I do not claim ownership of the original architectural idea.
This repository exists purely as a **learning and experimentation project** built on top of that inspiration.

---

## 🧠 What I’m Practicing / Learning

### 🏗 Architecture

* Clean Architecture (Data → Domain → Presentation)
* SOLID principles
* Feature-driven modular structure
* Separation of concerns
* Repository pattern
* Use cases

### 🔄 State Management & Navigation

* Riverpod (providers, notifiers, generators)
* Dependency injection using Riverpod
* GoRouter for navigation and redirection
* Global session handling

### 🌐 Networking & Data

* Dio for API calls
* Interceptors for token refresh and error handling
* Secure token storage
* Local persistence
* Protobuf experimentation
* GraphQL experimentation

### 🧪 Testing

* Unit testing for services and use cases
* Mockito / Mocktail usage
* Test-driven learning

### 🔐 App Quality & Reliability

* Firebase Analytics
* Firebase Crashlytics
* Global error handling
* Debug logging control
* Secure storage practices

### 🎨 UI & Animations

* Rive animations
* Responsive UI practices
* Reusable widgets

---

## 📁 Project Structure (Current)

```
lib/
├── src/
│   ├── config/                      # App-level configs (routes, env, app setup)
│   │   └── router/                  # Navigation & GoRouter setup
│   │       ├── app_router.dart
│   │       └── routes.dart
│   │
│   ├── core/                        # Core utilities, services & foundational layers
│   │   ├── analytics_and_crashlytics/ # Firebase analytics + crash logging
│   │   ├── base/                    # Base classes (BaseNotifier, BaseService, etc.)
│   │   ├── di/                      # Dependency injection setup
│   │   │   ├── parts/               # DI modules grouped by feature
│   │   │   └── dependency_injection.dart
│   │   │
│   │   ├── services/                # App-wide reusable services
│   │   │   ├── network/             # Dio client, interceptors, API setup
│   │   │   ├── snackbar/            # Global snackbar service
│   │   │   ├── storage/             # Secure/local storage handlers
│   │   └── utils/                   # Utility functions & helpers
│   │   └── providers.dart           # Global Riverpod providers
│   │
│   ├── features/                    # Feature-driven modules
│   │   ├── authentication/          # Auth module
│   │   │   ├── data/                # API models + repositories
│   │   │   │   ├── models/          # Freezed models
│   │   │   │   └── repositories/    # Data repository implementations
│   │   │   ├── domain/              # Business logic contracts
│   │   │   │   ├── entities/        # Domain-layer entity models
│   │   │   │   └── repositories/    # Abstract repository interfaces
│   │   │   ├── usecase/             # Authentication usecases
│   │   │   └── presentation/        # UI + state management
│   │   │       ├── notifiers/       # Riverpod Notifiers
│   │   │       └── pages/           # Screens & widgets
│   │   └── profile/                 # Profile feature module
│   │
│   └── shared/                      # Reusable UI widgets, extensions, mixins
│
├── unorganized_files/               # Temporary storage for unstructured files
├── firebase_options.dart            # Firebase initialization config
└── main.dart                        # App entry point
```

> Structure may evolve as I continue learning and experimenting.

---

## 🛠 Tech Stack & Tools Used

* Flutter
* Riverpod + Generator
* GoRouter
* Dio
* Freezed + Json Serializable
* Firebase (Analytics, Crashlytics)
* Rive
* Protobuf
* GraphQL
* Mockito / Mocktail
* Build Runner

---

## 🚀 Running Locally

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

---

## ⚠️ Disclaimer

This repository:

* ❌ Is not intended to be a production-ready project
* ❌ Is not guaranteed to be stable or clean at all times
* ❌ May contain experiments, breaking changes, and refactors

It is purely a **personal learning playground**.

---

## ✨ Final Note

Big thanks to **Momshad Dinury** for providing such a solid architectural foundation that helped accelerate my learning.

This repo represents my growth journey in Flutter development 🚀
