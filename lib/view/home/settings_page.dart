import 'package:exam_project/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SettingsProvider(),
      builder: (BuildContext context, Widget? child) => Scaffold(
          appBar: AppBar(
            title: const Text("Settings"),
            actions: [
              IconButton(
                  onPressed: context.read<SettingsProvider>().downloadFile,
                  icon: const Icon(Icons.download))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child:
                      Text(context.watch<SettingsProvider>().downloadMessage)),
             context.watch<SettingsProvider>().isDownloaded? const Icon(Icons.done) :CircularProgressIndicator(
                value: context.watch<SettingsProvider>().progresValue,

              )
            ],
          )),
    );
  }
}
