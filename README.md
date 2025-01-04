# ToDo-Posts-App

A Flutter application built with Clean Architecture, featuring task management, API-driven posts display, theme toggling, and smooth screen transitions.

## Features
- **Splash Page**: An introductory screen when the app launches.
- **ToDo Management**:
  - Add tasks.
  - Mark tasks as complete or incomplete.
  - Persistent storage of tasks using SharedPreferences.
- **Posts Screen**:
  - Displays posts fetched from an API.
  - Includes a search box to filter posts by `userId`.
- **Animations**: Smooth transitions between screens (right-to-left and left-to-right).
- **Theme Toggling**: Switch between light and dark modes.

## Getting Started

### Prerequisites
- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK (comes with Flutter)
- Android Studio or Visual Studio Code (optional for IDE support)

### Dependencies
Ensure the following dependencies are included in your `pubspec.yaml` file:
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^6.2.1
  shared_preferences: ^2.3.4
  dartz: ^0.10.1
  flutter_bloc: ^8.1.6
  get_it: ^8.0.3
  http: ^1.2.2
  uuid: ^4.5.1
  lottie: ^3.3.0
```
Run `flutter pub get` to fetch the dependencies.

### Running the App
1. Clone the repository:
   ```bash
   git clone https://github.com/Sumit-9900/ToDo-Posts-App
   ```
2. Navigate to the project directory:
   ```bash
   cd ToDo-Posts-App
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Folder Structure
The project follows the **Clean Architecture** principle:
- `core`: Contains shared utilities, constants, and theme management.
- `features`:
  - `todo`: Includes UI, logic, and data for ToDo tasks.
  - `post`: Includes UI, logic, and data for Posts.

## Conclusion
ToDo-Posts-App is a robust Flutter application designed with best practices and Clean Architecture, making it a scalable and maintainable project for managing tasks and viewing posts. Explore, enhance, and adapt it to your needs!
