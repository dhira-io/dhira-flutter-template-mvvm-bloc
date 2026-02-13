# Dhira Flutter Template - MVVM & BLoc

A premium, scalable, and enterprise-grade Flutter starter template designed for high-performance modular applications. Built using **Clean Architecture**, **BLoC** for state management, **GetX** for dependency injection, and **GoRouter** for advanced navigation.

---

## 🏗️ Architecture Overview

The project follows the principles of **Clean Architecture** combined with the **MVVM (Model-View-ViewModel)** pattern using BLoC as the ViewModel. This ensures a strict separation of concerns, making the codebase highly testable and maintainable.

### 🏛️ Layered Structure
- **Domain Layer**: The core of the application. Contains Entities, Repository Interfaces, and Use Cases. It is completely independent of other layers.
- **Data Layer**: Responsible for data retrieval and persistence. Contains Repository Implementations, Models (DTOs), and Data Sources (Remote & Local).
- **Presentation Layer**: The UI and state management logic. Contains BLoCs, Screens (Views), and Widgets.

### � Folder Structure
```text
lib/
├── core/               # Core framework and shared infrastructure
│   ├── constants/      # Global constants and flavor configs
│   ├── di/             # Global dependency injection bindings (GetX)
│   ├── error/          # Global exception and failure handling
│   ├── network/        # Networking layer (Dio, Interceptors, Network Info)
│   ├── routing/        # App routing (GoRouter)
│   ├── storage/        # Local storage (Secure Storage, Token Repo, Hive)
│   └── theme/          # App-wide theme and styling (Material 3)
├── features/           # Feature-driven modules (Clean Architecture)
│   ├── auth/           # Authentication feature reference
│   │   ├── data/       # Models, Repositories Impl, Data Sources
│   │   ├── domain/     # Entities, Repositories Interfaces, Use Cases
│   │   └── presentation/# BLoCs, Screens, Bindings
│   └── dashboard/      # Main dashboard feature
├── shared/             # Reusable UI components and extensions
│   ├── components/     # Atomic UI widgets (Buttons, TextFields, Loaders)
│   ├── dialogs/        # Global dialogs and overlays
│   └── extensions/     # Common Dart/Flutter extensions
├── l10n/               # Generated localization files
└── main.dart           # Unified entry point & bootstrapping
```

### �🗺️ Dependency Graph
```mermaid
graph TD
    UI[Presentation Layer: Screens/Widgets] --> BLoC[BLoC/Cubit]
    BLoC --> UC[Domain Layer: Use Cases]
    UC --> RI[Domain Layer: Repository Interfaces]
    DI[Data Layer: Repository Impl] -- "Implements" --> RI
    DI --> DS[Data Layer: Data Sources]
    DS --> API[Remote API]
    DS --> DB[Local Database]
```

---

## 🎨 App Flavors & Environments

The template is fully configured with three native flavors: **Development (dev)**, **Quality Assurance (qa)**, and **Production (prod)**.

### 🌍 Environment Configurations

| Attribute | Development (`dev`) | QA (`qa`) | Production (`prod`) |
|---|---|---|---|
| **App Name** | Dhira Dev | Dhira QA | Dhira |
| **Package ID** | `io.dhira.template.dev` | `io.dhira.template.qa` | `io.dhira.template` |
| **Base URL** | `https://dev-api.dhira.io/v1` | `https://qa-api.dhira.io/v1` | `https://api.dhira.io/v1` |

### 🚀 Running the App
You can run the app for specific environments using the custom entry points:

- **Run Dev**: `flutter run -t lib/main_dev.dart --flavor dev`
- **Run QA**: `flutter run -t lib/main_qa.dart --flavor qa`
- **Run Prod**: `flutter run -t lib/main_prod.dart --flavor prod`

*Alternatively, use `--dart-define=FLAVOR=dev` if running from `main.dart`.*

### 📦 Building the App

#### Android (APK/AppBundle)
```bash
# Build Dev APK
flutter build apk --flavor dev -t lib/main_dev.dart

# Build Prod AppBundle
flutter build appbundle --flavor prod -t lib/main_prod.dart
```

#### iOS (IPA)
```bash
# Build Dev IPA
flutter build ipa --flavor dev -t lib/main_dev.dart

# Build Prod IPA
flutter build ipa --flavor prod -t lib/main_prod.dart
```

---

## 🤖 Feature Generation Prompt (AI/Sigma)

Use the following specialized prompt to generate new features that perfectly match this template's architecture. Use the `auth` module in `lib/features/auth` as the primary reference.

### 📝 Prompt Template
```text
Generate a new feature module called '[FEATURE_NAME]' for this Flutter template.
Follow the Clean Architecture + BLoC pattern as seen in 'lib/features/auth'.

Structure requirements:
1. Domain Layer:
   - Create [FEATURE_NAME]_entity.dart (Freezed)
   - Create [FEATURE_NAME]_repository.dart (Interface)
   - Create use cases (e.g., Get[FEATURE_NAME]UseCase)
2. Data Layer:
   - Create [FEATURE_NAME]_model.dart (JSON serialization)
   - Create [FEATURE_NAME]_remote_data_source.dart (using DioClient)
   - Create [FEATURE_NAME]_repository_impl.dart
3. Presentation Layer:
   - Create [FEATURE_NAME]_bloc.dart, event.dart, state.dart (using BLoC & Freezed)
   - Create [FEATURE_NAME]_screen.dart and [FEATURE_NAME]_binding.dart (GetX)

Reference Code:
- Use 'lib/features/auth' for layer separation logic.
- Use 'lib/core/network/dio_client.dart' for API calls.
- Use 'lib/core/routing/app_router.dart' to register the new routes.
- Use 'assets/lang/app_en.arb' for all UI strings.
```

---

## 🛠️ Tech Stack & Key Packages

- **State Management**: `flutter_bloc`, `equatable`
- **Dependency Injection**: `get`
- **Navigation**: `go_router`
- **Networking**: `dio` with `interceptors`
- **Data Persistence**: `hive` & `flutter_secure_storage`
- **Boilerplate reduction**: `freezed`, `json_serializable`
- **Localization**: `flutter_localizations` (ARB files)
