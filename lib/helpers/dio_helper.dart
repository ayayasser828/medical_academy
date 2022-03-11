
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../constant/end_points.dart';
import '../constant/global_variables.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Connection': 'keep-alive',
      'Authorization':'Bearer ${prefs.getString('token')}',
      'Content-Type': 'application/json'
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, String> data,
    String? token,
  }) async {
    debugPrint(data.toString());
    dio.options.headers = {
      'Connection': 'keep-alive',
      'Authorization': 'Bearer ${prefs.getString('token')}',
      'Content-Type': 'application/json'
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            print("status code here${status}");
            return status! < 500;
          }),
    );
  }

  Future<void> deleteUser({required String id}) async {
    try {
      await dio.delete(baseURL + '/users/$id');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}


