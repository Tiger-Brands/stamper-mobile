import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final _dioOptions = BaseOptions(
  baseUrl: 'https://api.notchpay.co',
  connectTimeout: const Duration(seconds: 60),
  receiveTimeout: const Duration(seconds: 60),
  headers: {
    'Content-Type': 'application/json',
    'Authorixaation': dotenv.get('NOTCH_PAY_API_AUTHORIZATION_KEY')
  },
);
final dio = Dio(
  _dioOptions,
)..interceptors.add(
    LogInterceptor(responseBody: true),
  );
