import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  Failure(this.error);
}

class ServiceFailure extends Failure {
  ServiceFailure(super.error);

  factory ServiceFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure('Connection Timeout,Please try again!');
      case DioExceptionType.sendTimeout:
        return ServiceFailure('Send Timeout,Please try again!');
      case DioExceptionType.receiveTimeout:
        return ServiceFailure('Receive Timeout,Please try again!');
      case DioExceptionType.badCertificate:
        return ServiceFailure('Bad Certificate,Please try again!');
      case DioExceptionType.badResponse:
        return ServiceFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return ServiceFailure('Resqust was canceled, Please try again!');
      case DioExceptionType.connectionError:
        return ServiceFailure('No Internet Connection, Please try again!');
      case DioExceptionType.unknown:
        return ServiceFailure('Opps there was an Error, Please try again!');
    }
  }

  factory ServiceFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403 || statusCode == 422) {
      String errMsg = '';

      if (response is String) {
        return ServiceFailure(response);
      }
      errMsg = response['message_en'] ?? response['message'] ?? '';
      return ServiceFailure(errMsg);
    } else if (statusCode == 404) {
      return ServiceFailure('Resqust Not Found, Please try again!');
    } else if (statusCode >= 500) {
      return ServiceFailure('Internal Server Error, Please try again!');
    } else {
      return ServiceFailure('Opps there was an Error, Please try again!');
    }
  }
}
