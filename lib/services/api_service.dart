import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter_chatgpt/constants/constants.dart';

class ApiService {
  static Future<void> fetchModels() async {
    try {
      final response = await http.get(
        Uri.parse('${modelsEndpoint}adqwdaw'),
        headers: {'Authorization': 'Bearer $apiKey'},
      );

      final jsonRes = jsonDecode(response.body);
      log('RESPONSE: $jsonRes');

      // check response
      if (jsonRes['error'] != null) {
        throw HttpException(jsonRes['error']['message']);
      }
      await Future.value(null);
    } catch (e) {
      log('ERROR: ${e.toString()}');
    }
  }
}
