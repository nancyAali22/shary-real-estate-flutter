# Shary Real Estate — Flutter Technical Assignment

An improved, production-quality re-implementation of the **Shary** real estate app's Home screen, built as a technical assignment following a job interview.

## Project Goal

Demonstrate senior-level Flutter engineering: Clean Architecture, SOLID principles, strong performance practices, and thoughtful UI/UX improvements over the original reference screens — while preserving the Shary brand identity.

## Important Note

This project uses **local mock data only**. There is no backend API, no Firebase, and no authentication server. The architecture is designed so a real API can be integrated later without rewriting the UI layer — only the `data/` layer would change.

## Tech Stack

- Flutter & Dart, Material 3
- `flutter_bloc` (Cubit) — state management
- `flutter_screenutil` — responsive sizing (.w/.h/.sp/.r)
- `get_it` — dependency injection
- `equatable` — value equality for states/entities
- `go_router` — navigation
- `google_fonts` (Cairo) — Arabic typography
- `shimmer` — skeleton loading states
- `intl` — locale-aware number formatting
- `bloc_test` (dev) — Cubit state-sequence testing

## Architecture

Clean Architecture, feature-first:
lib/
├── core/ # theme, constants, routing, DI, shared widgets, errors
└── features/
└── home/
├── data/ # mock datasource, models, repository impl
├── domain/ # entities, repository contract, use cases
└── presentation/ # Cubit, pages, widgets

## Getting Started

```bash
flutter pub get
flutter run
```

## Running Tests

```bash
flutter test
```

## Improvements Over the Original Shary Screens

- **Shimmer skeletons** shaped like the real feed instead of a generic spinner, to avoid layout jump on load.
- **Explicit Empty/Error states** with a retry action, instead of leaving the screen blank on failure.
- **Concurrent data loading**: the three Home use cases run in parallel via `Future`s instead of sequentially, cutting perceived load time.
- **Verified/investment badges** repositioned with consistent spacing and touch-safe sizing across both card types.
- **Long-title handling**: every title uses `maxLines` + `TextOverflow.ellipsis` to prevent overflow on small screens or long Arabic property names.
- **Graceful image fallback**: any missing/corrupt asset falls back to a branded placeholder icon instead of a broken-image glyph.

## Future Improvements (with a real backend)

- Replace `HomeLocalDataSourceImpl` with a remote datasource (interface is already in place — no UI changes needed).
- Real WhatsApp/phone deep links via `url_launcher` instead of the current "not connected" notice.
- Pagination for Recommended Properties once the dataset is no longer small and fixed.
- Pull-to-refresh on the Home feed.

## Screenshots / Screen Recording Guidance

When preparing the submission, capture: (1) Home — Loaded state, (2) Home — Loading skeleton, (3) Home — Empty state, (4) Home — Error state with retry, (5) a bottom-nav placeholder screen, (6) a short screen recording scrolling the full Home feed on both a small and a large device.