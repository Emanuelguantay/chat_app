import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/global/environments.dart';

class AuthService with ChangeNotifier {
  //final user;

  Future Login(String email, String password) async {
    final data = {'email': email, 'password': password};
      var url = Uri.parse('${Environments.apiUrl}/login');
      final resp = await http.post(url,
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});
  }
}
