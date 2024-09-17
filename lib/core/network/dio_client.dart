import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options = BaseOptions(
      baseUrl: 'https://api.example.com',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
    );
  }

  Dio get dio => _dio;

  // Adding headers (JWT)
  Future<void> addToken(String token) async {
    _dio.options.headers["Authorization"] = "Bearer $token";
  }

  // Example GET Request
  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  // Example POST Request
  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to send data');
    }
  }
}
