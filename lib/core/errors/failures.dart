import 'package:dio/dio.dart';

abstract class Failures {
  String message;

  Failures(this.message);
}

class RemoteFailures extends Failures {
  RemoteFailures(super.message);

  factory RemoteFailures.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return RemoteFailures('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return RemoteFailures('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return RemoteFailures('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return RemoteFailures.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return RemoteFailures('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return RemoteFailures('No Internet Connection');
        }
        return RemoteFailures('Unexpected Error !, Please try again!');
      default:
        return RemoteFailures('Ops There was an Error !, Please try again');
    }
  }

  factory RemoteFailures.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return RemoteFailures(response['message']);
    } else if (statusCode == 404) {
      return RemoteFailures('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return RemoteFailures('Internal Server error, Please try later');
    } else {
      return RemoteFailures('Ops There was an Error, Please try again');
    }
  }
}

class LocalFailures extends Failures {
  LocalFailures(super.message);
}




