# Shary Real Estate — Flutter Technical Assignment

An improved, production-quality re-implementation of the **Shary** real estate app's Home screen, built as a technical assignment following a job interview.

## Project Goal

This project demonstrates senior-level Flutter engineering: Clean Architecture, SOLID principles, strong performance practices, and thoughtful UI/UX improvements over the original reference screens — while preserving the Shary brand identity.

## Important Note

This project uses **local mock data only**. There is no backend API, no Firebase, and no authentication server. The architecture is designed so a real API can be integrated later without rewriting the UI layer.

## Tech Stack

- Flutter & Dart
- Material 3
- flutter_bloc (Cubit) for state management
- flutter_screenutil for responsive sizing
- get_it for dependency injection
- equatable for value equality
- go_router for navigation

## Architecture

Clean Architecture with a feature-first structure:
lib/
├── core/ # shared theme, constants, routing, DI, shared widgets
└── features/
└── home/
├── data/ # mock datasources, models, repository implementation
├── domain/ # entities, repository contracts
└── presentation/ # Cubit, pages, widgets


## Status

🚧 Work in progress — built incrementally, step by step.

## Improvements Over Original Screens

_(to be documented as features are implemented)_