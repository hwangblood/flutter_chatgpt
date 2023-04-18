import 'package:flutter/material.dart';

import 'package:flutter_chatgpt/widgets/widgets.dart';

import '../constants/constants.dart';

class BottomSheetService {
  static Future<void> showGPTModelModalSheet(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      backgroundColor: scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TextWidget(
                label: 'Chosen Model:',
                fontSize: 16.0,
              ),
              SizedBox(width: 8),
              Expanded(
                child: GPTModelDropDown(),
              ),
            ],
          ),
        );
      },
    );
  }
}
