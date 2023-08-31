import 'package:exam_project/model/users_model.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  final UsersModel data;
  const UserInfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
