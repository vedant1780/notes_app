# 📝 Notes App (Flutter + SQLite)
A simple Flutter application that allows users to add, edit, and delete notes using a local SQLite database through sqflite. The app demonstrates state management with setState, modal bottom sheets, and database CRUD operations.

## 📱 Features
 🗒️ Add new notes with title and description

 ✏️ Edit existing notes

 🗑️ Delete notes with confirmation

📦 Local data persistence using SQLite

🎨 Clean UI with Material Design

⚡ Responsive and fast CRUD operations

## 🛠️ Tech Stack
Category	Tool/Library
Frontend	Flutter (Dart)
State Mgmt	setState()
Database	sqflite
Local Paths	path_provider
UI Components	Modal Bottom Sheets, ListView, TextField

## 📂 Project Structure

lib/
├── main.dart
├── homepage.dart         # UI and logic
└── local/
    └── db_helper.dart    # SQLite DB handler

## 🧪 How It Works
HomePage loads all notes from local DB using DBHelper.

FloatingActionButton opens a modal bottom sheet for note creation.

Edit/Delete icons provide inline note modification.

DBHelper handles all CRUD operations in SQLite.

The UI is refreshed using setState() after any data change.

## 🚀 Getting Started
Clone the repository:
git clone https://github.com/vedant1780/flutter-notes-app.git
cd flutter-notes-app
Install dependencies:
flutter pub get
Run the app:
flutter run
## 🔧 Dependencies
yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.0
  path_provider: ^2.1.1
  path: ^1.8.3
  ## Screenshots
  <img width="540" height="1080" alt="Screenshot_20250804_080423" src="https://github.com/user-attachments/assets/4109661d-825f-4a12-87c2-1a2749549718" />
  <img width="540" height="1080" alt="Screenshot_20250804_080441" src="https://github.com/user-attachments/assets/82297922-4806-4136-9869-f278ed3a95b3" />

  
