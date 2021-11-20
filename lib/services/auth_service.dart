import 'dart:convert';

import 'package:chat_app/src/models/login_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/global/environments.dart';

class AuthService with ChangeNotifier {
  User? user;

  bool _authenticating = false;

  bool get authenticating => _authenticating;
  set authenticating(bool value) {
    _authenticating = value;
    notifyListeners();
  }

  Future login(String email, String password) async {
    authenticating = true;

    final data = {'email': email, 'password': password};
    var url = Uri.parse('${Environments.apiUrl}/login');
    final resp = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;
      print(loginResponse);
    } else {
      print("Error API");
    }
    authenticating = false;
  }
}
