# 📝 Flutter Notes App

A simple and elegant Flutter application for managing notes locally using SQLite. Users can add, edit, and delete notes with a clean Material Design interface. This app demonstrates core Flutter concepts like state management with `setState`, modal bottom sheets, and SQLite-based CRUD operations.

---

## 📱 Features

- 🗒️ Create new notes with a title and description  
- ✏️ Edit existing notes inline  
- 🗑️ Delete notes with confirmation prompts  
- 📦 Persistent local storage using SQLite  
- 🎨 Clean and intuitive UI built with Material Design  
- ⚡ Fast and responsive performance  

---

## 🛠️ Tech Stack

| Category       | Tool/Library               |
|----------------|----------------------------|
| Frontend       | Flutter (Dart)             |
| State Mgmt     | `setState()`               |
| Database       | `sqflite`                  |
| Local Paths    | `path_provider`            |
| UI Components  | Modal Bottom Sheets, ListView, TextField |

---

## 🧪 How It Works

- `HomePage` loads all notes from the local database using `DBHelper`.
- A `FloatingActionButton` opens a modal bottom sheet for creating new notes.
- Edit and delete icons allow inline modification of notes.
- `DBHelper` manages all CRUD operations with SQLite.
- The UI refreshes using `setState()` after any data change.

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/vedant1780/flutter-notes-app.git
cd flutter-notes-app

flutter pub get
flutter run
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.0
  path_provider: ^2.1.1
  path: ^1.8.3

```
#### Screenshots
<img width="540" height="1080" alt="Screenshot_20250804_080423" src="https://github.com/user-attachments/assets/4109661d-825f-4a12-87c2-1a2749549718" />
  <img width="540" height="1080" alt="Screenshot_20250804_080441" src="https://github.com/user-attachments/assets/82297922-4806-4136-9869-f278ed3a95b3" />

  
