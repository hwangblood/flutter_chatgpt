import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_chatgpt/providers/providers.dart';

import 'constants/constants.dart';
import 'screens/screens.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GPTModelsProvider(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ChatBot',
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          color: cardColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const ChatScreen(),
    );
  }
}
