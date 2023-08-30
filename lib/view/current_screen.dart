import 'package:exam_project/view/home_page.dart';
import 'package:exam_project/view/settings_page.dart';
import 'package:flutter/material.dart';

class CurrentScreen extends StatefulWidget {
  const CurrentScreen({super.key});

  @override
  State<CurrentScreen> createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  int currrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currrentIndex,
        children: const [HomePage(), SettingsPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currrentIndex,
          onTap: (value) {
            setState(() {
              currrentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ]),
    );
  }
}
