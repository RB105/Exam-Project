import 'package:exam_project/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) => _myScaffold(),
    );
  }

  Scaffold _myScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Builder(
        builder: (context) {
          if (context.watch<HomeProvider>().isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: context.watch<HomeProvider>().data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(context
                      .watch<HomeProvider>()
                      .data[index]
                      .name
                      .toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
