import 'package:exam_project/core/config/network_config.dart';
import 'package:exam_project/model/airports_model.dart';
import 'package:exam_project/model/recommendations_model.dart';
import 'package:exam_project/service/avia_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(UserInputState(AirPortsModel(), AirPortsModel(), null, null,
            false, false, false)) {
    /// city
    on<UpdateCityEvent>(updateCity);

    /// passager numbers
    on<UpdateNumEvent>(updateNum);

    /// get recommendations
    on<TicketSearchEvent>(getRecommendations);
  }

  /// Class instance
  AviaService aviaService = AviaService();

  // variables
  AirPortsModel fromWhere = AirPortsModel();
  AirPortsModel toWhere = AirPortsModel();
  int adultNum = 1;
  int childNum = 0;
  int babyNum = 0;
  DateTime? startDate = DateTime.now();
  DateTime? endDate;
  bool isBaggage = false;
  bool isBusiness = false;
  bool isDirect = false;

  /// api
  Future<void> getRecommendations(
      TicketSearchEvent event, Emitter<UserState> emit) async {
    emit(TicketsLoadingState());
    NetworkResponse response = await aviaService.getRecommendations(
        isBaggage: isBaggage,
        from: fromWhere.cityIataCode ?? "",
        to: toWhere.cityIataCode ?? "",
        date: "${startDate?.day}.${startDate?.month}.${startDate?.year}",
        returnDate: endDate != null
            ? "${endDate?.day}.${endDate?.month}.${endDate?.year}"
            : "",
        clas: isBusiness ? 'b' : 'a',
        adt: adultNum,
        chd: childNum,
        inf: babyNum,
        isDirect: isDirect ? 1 : 0);
    if (response is NetworkSuccessResponse) {
      emit(TicketsSuccessState(response.model));
    } else if (response is NetworkExceptionResponse) {
      emit(TicketsErrorState(response.exception));
    }
  }

  //
  void updateNum(UpdateNumEvent event, Emitter<UserState> emit) {
    // ADULT
    if (event.updateNumType == UpdateNumType.incrementAdult) {
      adultNum += event.num;
    } else if (event.updateNumType == UpdateNumType.decrementAdult) {
      if (adultNum > 1) {
        adultNum -= event.num;
      } else {
        adultNum = 1;
      }
    } // CHILD
    else if (event.updateNumType == UpdateNumType.incrementChild) {
      childNum += event.num;
    } else if (event.updateNumType == UpdateNumType.decrementChild) {
      if (childNum > 0) {
        childNum -= event.num;
      } else {
        childNum = 0;
      }
    } // BABY
    else if (event.updateNumType == UpdateNumType.incrementBaby) {
      babyNum += event.num;
    } else if (event.updateNumType == UpdateNumType.decrementBaby) {
      if (babyNum > 0) {
        babyNum -= event.num;
      } else {
        babyNum = 0;
      }
    }
    emit(UserInputState(fromWhere, toWhere, startDate, endDate, isBusiness,
        isBaggage, isDirect));
  }

  // city
  void updateCity(UpdateCityEvent event, Emitter<UserState> emit) {
    if (event.fromWhere) {
      fromWhere = event.airPortsModel;
      emit(UserInputState(fromWhere, toWhere, startDate, endDate, isBusiness,
          isBaggage, isDirect));
    } else {
      toWhere = event.airPortsModel;
      emit(UserInputState(fromWhere, toWhere, startDate, endDate, isBusiness,
          isBaggage, isDirect));
    }
  }
}

class HomeAirportsCubit extends Cubit<AirportsStates> {
  HomeAirportsCubit() : super(AirportsInitState());

  Future<void> getAirports({required String cityName}) async {
    emit(AirportsLoadingState());
    NetworkResponse response = await AviaService().getAirports(part: cityName);
    if (response is NetworkSuccessResponse) {
      emit(AirportSuccessState(response.model));
    } else if (response is NetworkExceptionResponse) {
      emit(AirportsErrorState(response.exception));
    }
  }
}
