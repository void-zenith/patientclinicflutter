import "dart:convert";

import "package:http/http.dart" as http;

import "../models/User.dart";

class UserController {
  static const String baseUrl = 'http://127.0.0.1:4000';

  static Future<bool> registerUser(
      String fullname, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/user'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            User(fullname: fullname, email: email, password: password)
                .toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<bool> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(User(email: email, password: password).toJson()),
      );

      if (response.statusCode == 200) {
        print(response.body);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw e;
    }
  }
}
