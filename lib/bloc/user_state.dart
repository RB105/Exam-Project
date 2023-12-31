part of 'user_bloc.dart';

abstract class UserState {}

class UserInputState extends UserState {
  String name;
  int age;
  DateTime dateTime;
  UserInputState(this.name, this.age, this.dateTime);
}

class UserErrorState extends UserState {
  String error;
  UserErrorState(this.error);
}
