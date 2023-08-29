import 'package:exam_project/core/config/network_config.dart';
import 'package:exam_project/core/extension/network_res_ext.dart';
import 'package:exam_project/model/users_model.dart';
import 'package:exam_project/service/json_placeholder_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getUsers();
  }
  // variables
  bool isLoading = false;
  List<UsersModel> data = [];
  String error = '';

  // instance from service
  JsonPlaceHolderService service = JsonPlaceHolderService();

  Future<void> getUsers() async {
    changeLoading();
    NetworkResponse response = await service.getUsers();
    if (response.isSuccess()) {
      data = response.model;
    } else if (response.isException()) {
      error = response.exception;
    }
    changeLoading();
  }

  // manage loading state
  void changeLoading() {
    if (isLoading) {
      isLoading = !isLoading;
    } else {
      isLoading = !isLoading;
    }
    notifyListeners();
  }
}
