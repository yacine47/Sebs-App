import 'package:dio/dio.dart';
import 'package:sebs_app/constants.dart';
import 'package:sebs_app/core/services/secure_storage_service.dart';
import 'package:sebs_app/core/utils/service_locator.dart';

class ApiService {
  final String baseUrl = kBaseApiUrl;
  final Dio _dio;
  final String contentType = 'application/json';
  final String accept = 'application/json';

  ApiService(this._dio) {
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers.addAll(
      {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-Api-Token': 'VrOrOCKrOhgmRT4Twyte3b4NCVT2gG2aWcptlC91',
      },
    );
  }

  Future<dynamic> get({required String endPoint}) async {
    final SecureStorageService secureStorageService = getIt.get<SecureStorageService>();
    final String? token = await secureStorageService.getToken();

    if (token == null) {
      final Response response = await _dio.get('$baseUrl$endPoint');
      return response.data;
    }
    final Response response = await _dio.get('$baseUrl$endPoint',
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }));

    return response.data;
  }

  dynamic post({required String endPoint, required Object data}) async {
    final SecureStorageService secureStorageService = getIt.get<SecureStorageService>();
    final String? token = await secureStorageService.getToken();
    if (token == null) {
      final Response response = await _dio.post(
        '$baseUrl$endPoint',
        data: data,
      );

      return response.data;
    }

    final Response response = await _dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(
        headers: {
          'authorization': 'Bearer $token',
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put({required String endPoint, required Object data}) async {
    final SecureStorageService secureStorageService = getIt.get<SecureStorageService>();
    final String? token = await secureStorageService.getToken();
    if (token == null) {
      final Response response = await _dio.put('$baseUrl$endPoint', data: data);

      return response.data;
    }

    final Response response = await _dio.put('$baseUrl$endPoint',
        data: data,
        options: Options(
          headers: {
            'authorization': 'Bearer $token',
          },
        ));
    return response.data;
  }

  Future<Map<String, dynamic>> delete({required String endPoint, required Object data}) async {
    final SecureStorageService secureStorageService = getIt.get<SecureStorageService>();
    final String? token = await secureStorageService.getToken();
    if (token == null) {
      final Response response = await _dio.delete('$baseUrl$endPoint', data: data);

      return response.data;
    }

    final Response response = await _dio.delete('$baseUrl$endPoint',
        data: data,
        options: Options(
          headers: {'authorization': 'Bearer $token'},
        ));
    return response.data;
  }
}
