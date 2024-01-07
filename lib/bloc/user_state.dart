part of 'user_bloc.dart';

abstract class UserState {}

class UserInputState extends UserState {
  AirPortsModel fromWhere;
  AirPortsModel toWhere;
  DateTime? startDate;
  DateTime? endDate;
  bool isBaggage;
  bool isBusiness;
  bool isDirect;
  UserInputState(this.fromWhere, this.toWhere, this.startDate, this.endDate,
      this.isBusiness, this.isBaggage, this.isDirect);
}

/// Airport States
abstract class AirportsStates extends UserState {
  AirportsStates();
}

class AirportsInitState extends AirportsStates {}

class AirportsLoadingState extends AirportsStates {}

class AirportsErrorState extends AirportsStates {
  String error;
  AirportsErrorState(this.error);
}

class AirportSuccessState extends AirportsStates {
  List<AirPortsModel> airPorts;
  AirportSuccessState(this.airPorts);
}

/// Tickets State
class TicketsLoadingState extends UserState {
  TicketsLoadingState();
}

class TicketsErrorState extends UserState {
  String error;
  TicketsErrorState(this.error);
}

class TicketsSuccessState extends UserState {
  final RecommedationsModel recommedationsModel;
  TicketsSuccessState(this.recommedationsModel);
}
