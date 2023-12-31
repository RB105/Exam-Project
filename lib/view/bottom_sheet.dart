import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(ModalBottomSheetRoute(
                  useSafeArea: true,
                  builder: (context) => Scaffold(
                        body: Column(
                          children: List.filled(
                              5,
                              const Center(
                                child: Text("Hi"),
                              )),
                        ),
                      ),
                  isScrollControlled: true));
            },
            child: const Text('SHeeT')),
      ),
    );
  }
}
