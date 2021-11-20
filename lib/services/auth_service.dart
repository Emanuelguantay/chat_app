import 'dart:convert';

import 'package:chat_app/src/models/login_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/global/environments.dart';

class AuthService with ChangeNotifier {
  User? user;

  bool _authenticating = false;

  // Create storage
  final _storage = new FlutterSecureStorage();
  //Get token
  static Future<String?> getToken() async{
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async{
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  bool get authenticating => _authenticating;
  set authenticating(bool value) {
    _authenticating = value;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    authenticating = true;
    bool statusValue = false; 

    final data = {'email': email, 'password': password};
    var url = Uri.parse('${Environments.apiUrl}/login');
    final resp = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    
    authenticating = false;
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;

      //TODO: Guardar token
      await _saveToken(loginResponse.token);
      statusValue = true;
    } else {
      statusValue = false;
    }

    return statusValue;
    
  }

  Future _saveToken(String? token) async{
    // Write value
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async{
    // Delete value
    await _storage.delete(key: 'token');
  }
}
