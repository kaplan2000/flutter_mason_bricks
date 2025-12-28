# {{name.pascalCase()}}

A Flutter mobile application built with a clean, scalable architecture.

## Getting Started

- To get started, run fallowing commands:

```zsh
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## Architecture

- This project follows a strict MVVM architecture with clear separation of concerns.

### Key principles

- No business logic in UI
- ViewModels handle UI state only
- Repositories return domain models wrapped in Either
- All dependencies are injected
- Code generation is mandatory and enforced

### Tech Stack

- Flutter
- Riverpod – state management
- Freezed – immutable models & union states
- Dio – networking
- GetIt – dependency injection
- AutoRoute – navigation
- fpdart – functional error handling
- json_serializable – serialization

### Project Structure

```
lib/
├── core/
│   ├── failure/
│   ├── network/
│   ├── di/
│   └── utils/
├── features/
│   └── <feature_name>/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── app/
|   ├── themes/
│   ├── router/
│   └── app.dart
└── main.dart
```

## Code generation

### To generate codes

```zsh
dart run build_runner build --delete-conflicting-outputs
```

### Watch mode

```zsh
dart run build_runner watch --delete-conflicting-outputs
```
