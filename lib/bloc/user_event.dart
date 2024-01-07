part of 'user_bloc.dart';

/// user events
abstract class UserEvent {}

class UpdateCityEvent extends UserEvent {
  bool fromWhere;
  AirPortsModel airPortsModel;
  UpdateCityEvent(this.fromWhere, this.airPortsModel);
}

enum UpdateNumType {
  incrementAdult,
  decrementAdult,
  incrementChild,
  decrementChild,
  incrementBaby,
  decrementBaby
}

class UpdateNumEvent extends UserEvent {
  UpdateNumType updateNumType;
  int num;
  UpdateNumEvent({required this.updateNumType, required this.num});
}

class TicketSearchEvent extends UserEvent {}
