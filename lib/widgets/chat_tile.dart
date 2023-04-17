import 'package:flutter/material.dart';

import 'package:flutter_chatgpt/constants/colors.dart';
import 'package:flutter_chatgpt/services/assets_manager.dart';

import 'text_widget.dart';

class ChatTile extends StatelessWidget {
  final String msg;

  /// if [chatIndex] is 0, the massage should be the question that user asked
  /// . And if [chatIndex] is 1, the message is the answer that from ChatGPT
  /// API
  final int chatIndex;

  const ChatTile({
    Key? key,
    required this.msg,
    required this.chatIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userImage
                      : AssetsManager.chatLogo,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextWidget(
                    label: msg,
                  ),
                ),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        children: const [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
