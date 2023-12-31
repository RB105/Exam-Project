import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

// Define the Bloc
class UserBloc extends Bloc<UserInputEvent, UserState> {
  UserBloc() : super(UserInputState("", 0, DateTime.now())) {
    //
    on<UpdateAgeEvent>((event, emit) {
      age = event.age;
      emit(UserInputState("", age, DateTime.now()));
    });
    on<UpdateNameEvent>((event, emit) {
      name = event.name;
      emit(UserInputState(name, age, dateTime));
    });
    on<UpdateDateEvent>((event, emit) {
      dateTime = event.date;
      emit(UserInputState(name, age, dateTime ));
    });
  }

  String name = "name";
  int age = 0;
  DateTime dateTime = DateTime.now();
}
