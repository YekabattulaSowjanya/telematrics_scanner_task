import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AppClient {
  Future<http.Response> fetchVehicleOptions(String baseURL) async {
    try {
      final url = Uri.parse(baseURL);

      final payload = {
        "clientid": 11,
        "enterprise_code": 1007,
        "mno": "9889897789",
        "passcode": 3476,
      };

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(payload),
      );

      return response;
    } on Exception catch (e) {
      debugPrint('Login Exception ${e.toString()}');
      rethrow;
    }
  }
}

// if (response.statusCode == 200) {
//   // Parse the response and return a Vehicle object
//   return Vehicle.fromJson(json.decode(response.body));
// } else {
//   throw Exception('Failed to load vehicle options');
// }
