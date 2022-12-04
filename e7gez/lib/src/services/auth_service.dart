

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:e7gez/src/models/user_model.dart';
import 'package:e7gez/src/models/login_response.dart';

import 'package:e7gez/src/global/environment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier{
  late User user;
  bool _loading = false;

   final _storage = const FlutterSecureStorage();

  bool get loading => _loading;
  set loading(value) {
    _loading = value;
    notifyListeners();
   }
Future login(String email, String password) async {
    loading = true;

    final request = {'email': email,'phoneNumber':'', 'password': password, 'methodType':1};

    final response = await http.post(Uri.parse('${Environment.apiUrl}/login'),
        body: jsonEncode(request),
        headers: {'Content-Type': 'application/json'});

    loading = false;

    if (response.statusCode == 200) {
      final data = loginResponseFromJson(response.body);
      user = data.user;
      await _saveToken(data.token);
      return true;
    } else {
      return false;
    }
  }

  Future _saveToken(String token) async {
    var writeToken = await _storage.write(key: 'token', value: token);
    var readToken = await _storage.read(key: 'token');
    return writeToken;
  }

   Future logout() async {
    await _storage.delete(key: 'token');
  }

  static Future<String?> getToken() async {
    final _storage = FlutterSecureStorage();
    return await _storage.read(key: 'token');
  }

  static Future<void> deleteToken() async {
    final _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> logged() async {
    var token = await _storage.read(key: 'token');
    token ??= "na";
    final response = await http.get(
        Uri.parse('${Environment.apiUrl}/login/renew'),
        headers: {'Content-Type': 'application/json', 'x-token': token});
print(response.statusCode);
    if (response.statusCode == 200) {
      print("loggedin");
      final data = loginResponseFromJson(response.body);
      user = data.user;
      await _saveToken(data.token);
      return true;
    } else {
      print("not loggedin");
      logout();
      return false;
    }
  }
}