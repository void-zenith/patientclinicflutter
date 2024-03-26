import "dart:convert";

import "package:http/http.dart" as http;

import "../models/Patient.dart";

class PatientController {
  static const String baseUrl = 'http://127.0.0.1:4000';

  static Future<bool> addPatient(String fullname, String email, String address,
      String number, String gender, String dob) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/patient'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(Patient(
                fullName: fullname,
                email: email,
                address: address,
                number: number,
                gender: gender,
                dob: dob)
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
}
