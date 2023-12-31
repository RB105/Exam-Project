part of 'user_bloc.dart';

abstract class UserInputEvent {}

class UpdateNameEvent extends UserInputEvent {
  final String name;

  UpdateNameEvent(this.name);
}

class UpdateAgeEvent extends UserInputEvent {
  final int age;

  UpdateAgeEvent(this.age);
}

class UpdateDateEvent extends UserInputEvent {
  final DateTime date;

  UpdateDateEvent(this.date);
}
