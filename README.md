# user_list_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



# 🧑‍💻 Flutter User Management App

A Flutter application built as part of an internship assignment to demonstrate:

- Responsive UI Design
- REST API Integration
- State Management using Provider

---

## 🚀 Features

- Fetch and display users from a REST API
- View user details on a separate screen
- Add new users (locally)
- Responsive layout (ListView on mobile, GridView on wide screens)
- Search users by name or email
- Error handling for API/network failures
- Smooth page transitions

---

## 📱 Screenshots

> _Add screenshots of your Home, Add User, and Detail pages if submitting on GitHub_

---

## 🛠️ Tech Stack

- **Flutter**
- **Provider** (State Management)
- **Dio** (API Networking)
- **Connectivity Plus** (Internet check)

---

## 📡 API Used

[https://jsonplaceholder.typicode.com/users](https://jsonplaceholder.typicode.com/users)

- Method: `GET`
- Description: Fetches a static list of user data

---

## 🧩 Folder Structure

lib/
├── models/
│ └── user_model.dart
├── providers/
│ └── user_provider.dart
├── services/
│ └── api_service.dart
├── screens/
│ ├── home_screen.dart
│ ├── add_user_screen.dart
│ └── user_detail_screen.dart
├── widgets/
│ └── user_tile.dart
├── utils/
│ └── route_transitions.dart
└── main.dart


## ⚙️ How to Run the Project

1. **Clone the Repository or Extract ZIP**
   ```bash
   git clone https://github.com/your-username/flutter-user-app.git
   cd flutter-user-app
   
2. Install Dependencies
    ```flutter pub get

3. Run the App
    ```flutter run


📋 Requirements
Flutter SDK ≥ 3.x
Android/iOS Emulator or Real Device
Internet Connection for fetching API

📝 Notes
New users are stored locally in memory (not sent to the server).
App includes a retry button for network/API failures.
Smooth transitions and responsive layout included.

🙌 Author
Aashu Kumar
🌐 LinkedIn
✉️ Email: yourname@email.com


📄 License
This project is for educational/demo purposes as part of an internship assignment.

---

### ✅ Final Suggestions:
- ✅ **Replace** `your-username`, `your-profile`, and `yourname@email.com` with your actual GitHub and LinkedIn profile links and email.
- 📸 **Add screenshots** in a `/screenshots` folder and reference them like:
  ```markdown
  ![Home Screen](screenshots/home.png)


Let me know if you'd like this version customized with:
- Your real GitHub/LinkedIn/email links
- Sample screenshots for insertion
- Additional setup for web/desktop

I can generate that for you too.