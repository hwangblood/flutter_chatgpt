import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter_chatgpt/constants/constants.dart';
import 'package:flutter_chatgpt/models/models.dart';

class ApiService {
  static Future<List<GPTModel>> fetchModels() async {
    try {
      final response = await http.get(
        Uri.parse(modelsEndpoint),
        headers: {'Authorization': 'Bearer $apiKey'},
      );

      final jsonRes = jsonDecode(response.body);

      // check error
      if (jsonRes['error'] != null) {
        throw HttpException(jsonRes['error']['message']);
      }

      final models = jsonRes['data'] as Iterable;

      return GPTModel.formJsonList(models);
    } on HttpException catch (e) {
      log('ERROR (HTTP): ${e.toString()}');
      rethrow;
    } catch (e) {
      log('ERROR: ${e.toString()}');
      rethrow;
    }
  }
}
