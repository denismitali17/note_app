# Note App

**Note App** is a simple and efficient note-taking mobile application built using **Flutter**. It enables users to sign up, sign in, and manage their notes securely using **Firebase Authentication** and **Cloud Firestore**. Each user’s notes are isolated and synchronized in real time.

## Features

- **User Authentication**  
  Secure sign-up and sign-in with email and password using Firebase Authentication.

- **Notes Management (CRUD)**
   - Create new notes
   - Read and list notes in a scrollable list
   - Edit existing notes
   - Delete notes individually

- **Real-time Sync with Cloud Firestore**  
  Notes are automatically synced and updated across sessions.

- **Clean Architecture**
   - Proper separation of concerns between UI, logic, and data layers
   - State management implemented with the `Provider` package

- **Responsive Design**  
  Optimized UI for both portrait and landscape modes.

- **Loading & Feedback**
   - Snackbars for success/error messages
   - Loading indicators for long-running operations

## Tech Stack

| Layer            | Technology                   |
|------------------|------------------------------|
| Frontend         | Flutter                      |
| Language         | Dart                         |
| Backend Services | Firebase Auth & Firestore    |
| State Management | Provider                     |

## Project Structure

lib/  
├── models/            # Note model definitions  
├── pages/             # Screens: login, signup, home  
├── providers/         # State management using Provider  
├── services/          # Firebase auth and database logic  
├── widgets/           # Reusable UI components  
├── firebase_options.dart  # Firebase config (excluded from GitHub)  
├── main.dart          # App entry point  
└── .env               # Environment variables (API keys etc.)

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/denismitali17/note_app.git
cd note_app
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Firebase Configuration

#### Android Setup:
- Go to the Firebase Console and create a new project.
- Enable **Authentication** (email/password) and **Cloud Firestore**.
- Download the `google-services.json` file and place it in:
  ```
  android/app/google-services.json
  ```

#### Environment Variables:
- Create a `.env` file in the root directory and add your Firebase credentials:
  ```
  API_KEY=your_api_key
  AUTH_DOMAIN=your_auth_domain
  PROJECT_ID=your_project_id
  STORAGE_BUCKET=your_storage_bucket
  MESSAGING_SENDER_ID=your_messaging_sender_id
  APP_ID=your_app_id
  MEASUREMENT_ID=your_measurement_id
  ```

- Add this dependency to your `pubspec.yaml`:
  ```yaml
  dependencies:
    flutter_dotenv: ^5.1.0
  ```

## Running the App

To launch the app on an emulator or physical device, run:
```bash
flutter run
```

## Security Notes

- DO NOT commit the following sensitive files:
   - `.env`
   - `google-services.json`
   - Any keystore, `.jks`, or signing credentials

- Make sure your `.gitignore` file includes:
  ```
  .env
  google-services.json
  *.jks
  *.keystore
  ```

- For production builds, enable ProGuard in `build.gradle.kts` and set:
  ```kotlin
  shrinkResources = true
  minifyEnabled = true
  ```

## Requirements

- Flutter SDK (>=3.7.0)
- Firebase project with Auth + Firestore enabled
- Android Studio or VS Code
- Android Emulator or physical device

## License

This project is intended for educational and demonstration purposes only. You are free to fork, improve, and use it for your own learning or personal projects.

## Author

Denis Mitali