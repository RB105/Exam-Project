import 'package:exam_project/provider/home_provider.dart';
import 'package:exam_project/provider/setting_provider.dart';
import 'package:exam_project/view/home/current_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SettingsProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrentScreen(),
    );
  }
}
