import 'package:flutter/material.dart';

import 'package:flutter_chatgpt/widgets/widgets.dart';

List<String> gptModels = [
  'Model1',
  'Model2',
  'Model3',
  'Model4',
  'Model5',
  'Model6',
];

List<DropdownMenuItem<String>>? get gptModelItems =>
    List<DropdownMenuItem<String>>.generate(
      gptModels.length,
      (index) {
        final model = gptModels.elementAt(index);
        return DropdownMenuItem(
          value: model,
          child: TextWidget(
            label: model,
            fontSize: 15,
          ),
        );
      },
    );
