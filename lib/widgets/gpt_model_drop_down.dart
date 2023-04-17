import 'package:flutter/material.dart';

import 'package:flutter_chatgpt/constants/constants.dart';

class GPTModelDropDown extends StatefulWidget {
  const GPTModelDropDown({super.key});

  @override
  State<GPTModelDropDown> createState() => _GPTModelDropDownState();
}

class _GPTModelDropDownState extends State<GPTModelDropDown> {
  String currentModel = gptModels.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: cardColor,
      iconEnabledColor: Colors.white,
      items: gptModelItems,
      value: currentModel,
      onChanged: (value) {
        setState(() {
          currentModel = value.toString();
        });
      },
    );
  }
}
