import 'package:exam_project/bloc/user_bloc.dart';
import 'package:exam_project/core/extension/size_build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeGetScren extends StatelessWidget {
  const AgeGetScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: context.width * 0.5,
          height: context.height * 0.07,
          child: TextFormField(
            onChanged: (value) {
              context.read<UserBloc>().add(UpdateAgeEvent(int.parse(value)));
            },
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Ok")),
    );
  }
}
