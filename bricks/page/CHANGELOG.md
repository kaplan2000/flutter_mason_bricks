# Changelog

All notable changes to the `page` brick will be documented in this file.

## [0.1.2] - 2025-12-28

### Added

- Added `use_autoroute` variable to optionally exclude AutoRoute implementation.
- Refactored state management to use a separate Freezed file (`{{page_name.snakeCase()}}_state.dart`).
- Updated UI template to handle loading, loaded, and error states using `state.when()`.

## [0.1.1] - 2025-12-28

### Fixed

- Corrected output path to `lib/features/`.

## [0.1.0] - 2025-12-28

### Added

- Initial release of the `page` brick.
- Generates a `ConsumerWidget` page with `AutoRoute` integration.
- Generates a corresponding `Notifier` ViewModel and state class.
- Support for `feature_name` and `page_name` variables.

