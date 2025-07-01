import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

enum Status { loading, success, error }

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  Status _status = Status.loading;
  String _error = '';
  List<User> _filteredUsers = [];

  List<User> get users => _filteredUsers;
  Status get status => _status;
  String get error => _error;

  /// Fetch users from API and initialize the filtered list
  Future<void> fetchUsers() async {
    _status = Status.loading;
    _error = '';
    notifyListeners();

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _status = Status.error;
      _error = 'No internet connection';
      notifyListeners();
      return;
    }

    try {
      _users = await ApiService.fetchUsers();
      _filteredUsers = _users;
      _status = Status.success;
    } catch (e) {
      _status = Status.error;
      _error = 'API Error: ${e.toString().replaceFirst('Exception: ', '')}';
    }

    notifyListeners();
  }

  /// Filter users by search query (name or email)
  void searchUser(String query) {
    if (query.isEmpty) {
      _filteredUsers = _users;
    } else {
      _filteredUsers = _users.where((user) {
        return user.name.toLowerCase().contains(query.toLowerCase()) ||
            user.email.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  /// Add New User
  void addUser(User user) {
    _users.add(user);
    _filteredUsers = _users;
    notifyListeners();
  }

  User getUserById(int id) => _users.firstWhere((user) => user.id == id);
}

