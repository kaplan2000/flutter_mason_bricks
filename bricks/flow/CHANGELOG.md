# Changelog

All notable changes to the `flow` brick will be documented in this file.

## [0.1.1] - 2025-12-28

### Fixed

- Corrected output path to `lib/features/`.
- Fixed "Unclosed tag" error by moving conditional file logic to a `post_gen` hook.

## [0.1.0] - 2025-12-28

### Added

- Initial release of the `flow` brick for domain and data skeleton generation.
- Generates domain models and abstract repositories.
- Generates repository implementations.
- Conditional generation of remote and mock data sources based on `has_remote` and `has_mock` flags.
- Clean boilerplate with TODOs for easy implementation.
