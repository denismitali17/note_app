# Note App

A simple and responsive note-taking app built with **Flutter**, using **Firebase Authentication** and **Cloud Firestore**. This app supports user sign up and sign in, and allows authenticated users to create, read, update, and delete personal notes in real-time.

## Features

- User registration and login (Firebase Auth)
- Add, update, and delete notes (Cloud Firestore)
- Responsive UI for both portrait and landscape orientations
- Clean architecture with state management using `Provider`
- Error handling and loading indicators
- Firebase initialization for Android

## Tech Stack

- **Flutter** (UI framework)
- **Firebase** (Auth, Firestore)
- **Provider** (State management)
- **Dart** (Language)

## Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/denismitali17/note_app.git
   cd note_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
    - Android:
        - Add your `google-services.json` file in `android/app/`
        - Ensure Firebase is initialized in `main.dart` using `Firebase.initializeApp()`

4. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── models/        # Data models
├── pages/         # UI screens
├── services/      # Firebase logic (auth, firestore)
├── widgets/       # Reusable UI components
└── main.dart      # Entry point
```

## Requirements

- Flutter SDK
- Firebase project with Authentication and Firestore enabled
- Android Emulator or physical device

## Important Notes

- Do **not** commit your Firebase `google-services.json` or keystore files to GitHub.
- Ensure `shrinkResources` and `minifyEnabled` are properly configured in `build.gradle.kts` for release builds.

## License

This project is for educational purposes.
