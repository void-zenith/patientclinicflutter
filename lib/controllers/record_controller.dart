import "dart:convert";

import "package:http/http.dart" as http;

import "../models/Record.dart";

class RecordController {
  static const String baseUrl = 'http://127.0.0.1:4000';

  static Future<bool> addRecord(
    String date,
    String recordTitle,
    String systolicBloodPressure,
    String diastolicBloodPressure,
    String respiratoryRate,
    String bloodOxygenLevel,
    String heartbeatRate,
    String recordSummary,
    bool isCritical,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/record'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(Record(
          date: date,
          recordTitle: recordTitle,
          systolicBloodPressure: systolicBloodPressure,
          diastolicBloodPressure: diastolicBloodPressure,
          respiratoryRate: respiratoryRate,
          bloodOxygenLevel: bloodOxygenLevel,
          heartbeatRate: heartbeatRate,
          recordSummary: recordSummary,
          isCritical: isCritical,
        ).toJson()),
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
