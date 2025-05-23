import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../service/env_services.dart';
import '../utils/enum.dart';

class ApiService {
  final Dio _dio;

  static final String n8nBase = Env.n8nBase;
  static final String n8nTest = Env.n8nTest;
  static final String n8nProd = Env.n8nProd;
  static final String serper = Env.serper;
  static final String apiKey = Env.apiKey;

  ApiService({String? baseUrl})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl ?? '',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ));

  void setHeaders(Map<String, String> headers) {
    _dio.options.headers.addAll(headers);
  }

  String _getBaseURL(EBaseURLType type) {
    switch (type) {
      case EBaseURLType.N8N_TEST:
        return '$n8nBase$n8nTest';
      case EBaseURLType.N8N_PROD:
        return '$n8nBase$n8nProd';
      case EBaseURLType.SUPABASE:
        return ""; // Cập nhật nếu cần
      case EBaseURLType.SERPER_NEWS:
        return '$serper/news';
      case EBaseURLType.SERPER_PLACES:
        return '$serper/places';
    }
  }
}
