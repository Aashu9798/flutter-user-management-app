# 🧑‍💻 A responsive Flutter app to manage users, built with Provider and REST API integration.

A Flutter application built as part of an internship assignment to demonstrate:

- Responsive UI Design
- REST API Integration
- State Management using Provider

---

## 🚀 Features

- Fetch and display users from a REST API
- View user details on a separate screen
- Add new users (stored locally)
- Responsive layout (ListView on mobile, GridView on wide screens)
- Search users by name or email
- Error handling for API/network failures
- Smooth page transitions

---

## 📸 App Screenshots

### 🏠 User List Page
![User List](assets/screenshots/user%20list.png)

### 👤 User Details Page
![User Details](assets/screenshots/user%20details.png)

### ➕ Add New User Page
![Add New User](assets/screenshots/add%20new%20user.png)

### 🔍 Search Filter
![Search Filter](assets/screenshots/search%20filter.png)

### ❌ No Search Found
![No Search Found](assets/screenshots/no%20search%20found.png)

### 📶 No Internet Page
![No Internet](assets/screenshots/no%20internet.png)

### 📱 Landscape View
![Landscape View](assets/screenshots/landscape%20view.png)


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
##  📁 Folder Structure

```
lib/
├── models/
│   └── user_model.dart
├── providers/
│   └── user_provider.dart
├── services/
│   └── api_service.dart
├── screens/
│   ├── home_screen.dart
│   ├── add_user_screen.dart
│   └── user_detail_screen.dart
├── widgets/
│   └── user_tile.dart
├── utils/
│   └── route_transitions.dart
└── main.dart
```



## 📦 How to Run the Project

1. **Clone the Repository or Extract ZIP**
   ```bash
   git clone https://github.com/Aashu9798/flutter-user-management-app.git
   cd flutter-user-management-app
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

---

🔧 **Requirements**

- Flutter SDK ≥ 3.x
- Android/iOS Emulator or Real Device
- Internet Connection for fetching API

🧠 **Notes**

- New users are stored locally in memory (not sent to the server).
- App includes a retry button for network/API failures.
- Smooth transitions and responsive layout included.



## 🙌 Author

**Aashu Kumar**

- 🌐 [LinkedIn](https://www.linkedin.com/in/aashu-shrivastava-6279b7259/)
- ✉️ [Email](mailto:aashuraaz727400@gmail.com)


## 📄 License

This project is for educational/demo purposes as part of an internship assignment.
