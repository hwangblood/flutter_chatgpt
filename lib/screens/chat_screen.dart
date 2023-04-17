import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter_chatgpt/constants/constants.dart';
import 'package:flutter_chatgpt/services/services.dart';
import 'package:flutter_chatgpt/widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = true;

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openaiLogo),
        ),
        centerTitle: false,
        title: const Text('ChatGPT'),
        actions: [
          Tooltip(
            message: 'Choose a model',
            child: IconButton(
              icon: const Icon(Icons.model_training),
              onPressed: () async {
                await showModalBottomSheet(
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
                        children: const [
                          Flexible(
                            child: TextWidget(
                              label: 'Chosen Model:',
                              fontSize: 16.0,
                            ),
                          ),
                          // TODO model dropdown button
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (BuildContext context, int index) {
                  final chatMessage = chatMessages.elementAt(index);
                  return ChatTile(
                    msg: chatMessage['msg'].toString(),
                    chatIndex: int.parse(
                      chatMessage['chatIndex'].toString(),
                    ),
                  );
                },
              ),
            ),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
            ],
            const SizedBox(height: 8),
            Material(
              color: cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        onSubmitted: (value) {
                          // TODO on submit message
                        },
                        decoration: const InputDecoration.collapsed(
                          hintText: 'How can I help you',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO on press send button
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
