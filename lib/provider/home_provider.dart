import 'package:exam_project/core/config/network_config.dart';
import 'package:exam_project/core/extension/network_response_ext.dart';
import 'package:exam_project/model/post_model.dart';
import 'package:exam_project/model/todo_model.dart';
import 'package:exam_project/model/users_model.dart';
import 'package:exam_project/service/json_placeholder_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getAll();
  }
  // variables
  bool isLoading = false;
  List<UsersModel> users = [];
  List<PostModel> posts = [];
  List<TodoModel> todos = [];
  String error = '';

  // instance from service
  JsonPlaceHolderService service = JsonPlaceHolderService();

  Future<void> getAll() async {
    getUsers();
    getPosts();
    getTodos();
  }

  Future<void> getUsers() async {
    changeLoading();
    NetworkResponse response = await service.getUsers();
    if (response.isSuccess) {
      users = response.model;
      clear();
    } else if (response.isException) {
      error = response.exception;
    }
    changeLoading();
  }

  Future<void> getPosts() async {
    changeLoading();
    NetworkResponse response = await service.getPosts();
    if (response.isSuccess) {
      posts = response.model;
      clear();
    } else if (response.isException) {
      error = response.exception;
    }
    changeLoading();
  }

  Future<void> getTodos() async {
    changeLoading();
    NetworkResponse response = await service.getTodos();
    if (response.isSuccess) {
      todos = response.model;
      clear();
    } else if (response.isException) {
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

  void clear() {
    error = '';
    notifyListeners();
  }
}
