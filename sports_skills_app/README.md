# Sports Skills App

A Flutter demo app for a sports-tech assignment. It parses a JSON list of skills and displays them in three horizontally scrollable carousels grouped by level (Basic -> Intermediate -> Advanced). Smooth scrolling, skeleton loaders, clean responsive UI, and Riverpod for state management.

## Features
- **Grouping & Order**: Basic, Intermediate, Advanced.
- **Horizontal carousels** with padded edges and smooth scrolling.
- **Shimmer skeletons** while loading.
- **Responsive cards**: width and list height adapt to screen size/orientation.
- **Detail bottom sheet** on tap: large image, level chip, description.
- **Riverpod** for state management and repository pattern for data.

## Tech Stack
- Flutter 3.x, Dart 3.x
- flutter_riverpod, cached_network_image, shimmer, http

## Run Locally
```bash
flutter pub get
flutter run -d chrome   # or an attached iOS/Android device
```

## Project Structure
```
lib/
  main.dart                         # App entry, wiring providers and UI
  models/skill.dart                 # Skill model (name, level, image, imageLarge, description)
  repositories/skill_repository.dart# Data source (mock JSON; swap to API here)
  providers/skill_provider.dart     # Riverpod providers
  widgets/
    section_header.dart             # Centered title with left/right dividers
    skill_card.dart                 # Card with image, name, shimmer loading
    skills_list.dart                # Horizontal carousel per section
    skill_detail_sheet.dart         # Bottom sheet with large image + description
```

## Data Source
- Mock JSON lives in `lib/repositories/skill_repository.dart` inside `fetchSkills()`.
- Replace with your API call and map the JSON to `Skill.fromJson()`.
- Fields used: `name`, `level`, `image`, `imageLarge` (optional), `description` (optional).

## Notes on Images
- Images are sports-specific (Unsplash links with cropping parameters). If any image 404s due to external hosting changes, the card will show a fallback icon; update URLs in `skill_repository.dart`.

- Tweak card sizing rules in `widgets/skills_list.dart` (variables `cardWidth` and `listHeight`).
- Style headers in `widgets/section_header.dart`.
- Extend the model with additional fields (e.g., tags, difficulty score) and surface them in the detail sheet.

---
Feel free to open an issue or PR for enhancements like search, snapping carousels, grid view, or hero animations.
