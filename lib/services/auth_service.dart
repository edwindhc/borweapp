import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:borweapp/models/login_response.dart';
import 'package:flutter/material.dart';
import 'api_methods.dart';

class AuthService with ChangeNotifier {
  late LoginResponse user;
  bool _authenticating = false;

  //create storage
  final _storage = const FlutterSecureStorage();

  bool get authenticating => _authenticating;
  set authenticating(bool value) {
    _authenticating = value;
    notifyListeners();
  }

  // Token Getters

  static Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token;
  }

  static Future<Void?> deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    return null;
  }

  Future login(String email, String password) async {
    authenticating = true;
    final data = {'email': email, 'password': password};
    final resp = await ApiMethods().post('api/login', data);
    authenticating = false;
    // ignore: avoid_print
    if (jsonDecode(resp.body)["ok"] == false) return false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      user = loginResponse;
      return true;
    }
  }

  // ignore: unused_element
  Future _saveToken(String? token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }
}
