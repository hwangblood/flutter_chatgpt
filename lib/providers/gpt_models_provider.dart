import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:flutter_chatgpt/models/models.dart';
import 'package:flutter_chatgpt/services/api_service.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class GPTModelsProvider extends ChangeNotifier {
  List<GPTModel>? _models;

  String _currentModel = 'text-davinci-003';
  String get currentModel => _currentModel;

  Future<List<GPTModel>> get models async {
    if (_models == null) {
      _models = await ApiService.fetchModels();
      notifyListeners();
    }
    return UnmodifiableListView(_models!);
  }

  void updateCurrentModel(String modelId) {
    _currentModel = modelId;
    notifyListeners();
  }
}
