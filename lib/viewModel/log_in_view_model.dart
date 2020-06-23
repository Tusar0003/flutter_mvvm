import 'package:flutter/material.dart';
import 'package:fluttermvvm/repository/log_in_repository.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

class LogInViewModel extends ChangeNotifier {

  bool _isLoggedIn = false;
  String _error;

  Future<void> logIn(String userName, String password) async {
    _isLoggedIn = await LogInRepository().logIn(userName, password);

    if (!_isLoggedIn) {
      _error = 'Log In failed! Please try again';
    }

    notifyListeners();
  }

  bool get isLoggedIn => _isLoggedIn;
  String get error => _error;

  set setIsLoggedIn(bool value) {
    _isLoggedIn = value;
  }
}