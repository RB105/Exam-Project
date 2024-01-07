import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exam_project/core/config/network_config.dart';
import 'package:exam_project/model/airports_model.dart';
import 'package:exam_project/model/recommendations_model.dart';

class AviaService {
  Future<NetworkResponse> getAirports({required String part}) async {
    try {
      Response response = await Dio().post(
          "https://gw.flysells.uz/avia/airports",
          data: {"lang": "en", "part": part});

      if (response.statusCode == 200) {
        if (response.data['data'] is List && response.data['data'].isEmpty) {
          return NetworkExceptionResponse(exception: "nothingFound");
        } else {
          return NetworkSuccessResponse(
              model: (response.data['data']['cities'] as Map)
                  .values
                  .map((e) => AirPortsModel.fromJson(e))
                  .toList());
        }
      } else {
        return NetworkExceptionResponse(
            exception: response.statusMessage ?? "");
      }
    } on DioException catch (e) {
      return NetworkExceptionResponse(
          exception: e.response?.statusMessage ?? "");
    }
  }

  Future<NetworkResponse> getRecommendations(
      {required bool isBaggage,
      required String from,
      required String to,
      required String date,
      required String returnDate,
      required String clas,
      required int adt,
      required int chd,
      required int inf,
      required int isDirect}) async {
    try {
      Response response = await Dio()
          .post('https://gw.flysells.uz/avia/get-recommendations', data: {
        "is_baggage": isBaggage,
        "is_charter": false,
        "price_order": 1,
        "adt": adt,
        "chd": chd,
        "inf": inf,
        "ins": 0,
        "src": 0,
        "yth": 0,
        "lang": "en",
        "segments": returnDate.isEmpty
            ? [
                {"from": from, "to": to, "date": date}
              ]
            : [
                {"from": from, "to": to, "date": date},
                {"from": to, "to": from, "date": returnDate}
              ],
        "filter_airlines": [],
        "is_direct_only": isDirect,
        "gds_white_list": [],
        "gds_black_list": [],
        "class_": clas
      });

      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          RecommedationsModel data =
              RecommedationsModel.fromJson(response.data['data']);
          if (data.flights.isEmpty) {
            return NetworkExceptionResponse(exception: "Nothing found");
          }
          return NetworkSuccessResponse(model: data);
        } else {
          return NetworkExceptionResponse(exception: 'qsb yashila');
        }
      } else {
        return NetworkExceptionResponse(
            exception: response.statusMessage ?? "");
      }
    } on DioException catch (e) {
      return NetworkExceptionResponse(
          exception: e.response?.statusMessage ?? "something");
    } on SocketException catch (e) {
      return NetworkExceptionResponse(exception: e.message);
    }
  }
}
