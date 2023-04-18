import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_chatgpt/constants/constants.dart';
import 'package:flutter_chatgpt/models/models.dart';
import 'package:flutter_chatgpt/providers/providers.dart';
import 'package:flutter_chatgpt/widgets/widgets.dart';

class GPTModelDropDown extends StatelessWidget {
  const GPTModelDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    // watch the state changes
    final gptModelsProvider = context.watch<GPTModelsProvider>();
    return SizedBox(
      height: 50,
      child: Center(
        child: FutureBuilder<List<GPTModel>>(
          future: gptModelsProvider.models,
          builder:
              (BuildContext context, AsyncSnapshot<List<GPTModel>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const TextWidget(
                  label: 'loading...',
                );
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return TextWidget(
                    label: snapshot.error.toString(),
                  );
                }
                return snapshot.data == null || snapshot.data!.isEmpty
                    ? const SizedBox.shrink()
                    : DropdownButton(
                        dropdownColor: cardColor,
                        iconEnabledColor: Colors.white,
                        items: List<DropdownMenuItem<String>>.generate(
                          snapshot.data!.length,
                          (index) {
                            final model = snapshot.data!.elementAt(index);
                            return DropdownMenuItem(
                              value: model.id,
                              child: TextWidget(
                                label: model.id,
                                fontSize: 15,
                              ),
                            );
                          },
                        ),
                        value: gptModelsProvider.currentModel,
                        onChanged: (value) {
                          gptModelsProvider.updateCurrentModel(value!);
                        },
                      );
            }
          },
        ),
      ),
    );
  }
}
