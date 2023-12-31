import 'package:exam_project/bloc/user_bloc.dart';
import 'package:exam_project/view/user/age_get.dart';
import 'package:exam_project/view/user/name_get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInputState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(context.watch<UserBloc>().name),
                          Text("${context.watch<UserBloc>().age}"),
                          Text("${context.watch<UserBloc>().dateTime.day}"),
                        ],
                      )),
                  Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const NameGetScren(),
                                ));
                              },
                              child: const Text("Name")),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AgeGetScren(),
                                ));
                              },
                              child: const Text("Age")),
                          ElevatedButton(
                              onPressed: () async {
                                var date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2050)) ??
                                    DateTime.now();
                                context
                                    .read<UserBloc>()
                                    .add(UpdateDateEvent(date));
                              },
                              child: const Text("Date")),
                        ],
                      ))
                ],
              ),
            );
          } else {
            return const Text('Unhandled state');
          }
        },
      ),
    );
  }
}
