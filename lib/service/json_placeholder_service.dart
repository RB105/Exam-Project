import 'package:dio/dio.dart';
import 'package:exam_project/core/config/dio_config.dart';
import 'package:exam_project/core/config/network_config.dart';
import 'package:exam_project/core/constants/endpoints.dart';
import 'package:exam_project/model/post_model.dart';
import 'package:exam_project/model/users_model.dart';

class JsonPlaceHolderService with DioConfigration {
  // get user method
  Future<NetworkResponse> getUsers() async {
    try {
      // sends request '/users'
      Response response = await createRequest().get(EndPoints.users);
      // return List<UsersModel>
      return NetworkSuccessResponse(
          model: (response.data as List)
              .map((e) => UsersModel.fromJson(e))
              .toList());
    } on DioException catch (e) {
      // return network exception
      return NetworkExceptionResponse(exception: catchError(e));
    }
  }

  // get posts method
  Future<NetworkResponse> getPosts() async {
    try {
      // send request /posts
      Response response = await createRequest().get(EndPoints.post);
      // return List<PostModel>
      return NetworkSuccessResponse(
          model: (response as List).map((e) => PostModel.fromJson(e)).toList());
    } on DioException catch (e) {
      // return network exception
      return NetworkExceptionResponse(exception: catchError(e));
    }
  }
}
