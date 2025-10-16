// lib/services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ipc_section.dart';

class ApiService {
  // This function now takes an actName to fetch data for any act
  static Future<List<IpcSection>> fetchSectionsForAct(String actName) async {
    // IMPORTANT: Replace YOUR_COMPUTER_IP with your actual network IP.
    final url = 'http://10.180.29.246:5000/api/act/$actName';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((section) => IpcSection.fromJson(section))
            .toList();
      } else {
        throw Exception(
          'Failed to load sections (Status code: ${response.statusCode})',
        );
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
