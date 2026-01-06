import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:teglax_assignment/network/api_url.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  /// Create Get Api Service
  Future<Response?> getData(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
      );

      return response;

    } on DioException catch (e) {
      debugPrint('DioError: ${e.response?.statusCode} - ${e.message}');
      return e.response;
    } catch (e) {
      debugPrint('Catch Error: $e');
      return null;
    }
  }
}