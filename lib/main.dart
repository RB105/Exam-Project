import 'package:exam_project/bloc/user_bloc.dart';
import 'package:exam_project/view/user/usar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(BlocProvider(create: (context) => UserBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: UserPage(),
    );
  }
}
