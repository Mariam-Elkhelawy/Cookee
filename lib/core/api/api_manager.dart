import 'package:CookEE/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    return dio.get(Constants.baseURL + endPoint,
        queryParameters: queryParameters, options: Options(headers: headers));
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.post(Constants.baseURL + endPoint,
        data: body, options: Options(headers: headers));
  }

  Future<Response> deleteData(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.delete(Constants.baseURL + endPoint,
        data: body, options: Options(headers: headers));
  }

  Future<Response> putData(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.put(Constants.baseURL + endPoint,
        data: body, options: Options(headers: headers));
  }
}
