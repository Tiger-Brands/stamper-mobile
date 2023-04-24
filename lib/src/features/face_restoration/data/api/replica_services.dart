// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io' show File;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:photoreboot/src/constants/keys.dart';

class ReplicaServices {
  Future<void> predict({required File image}) async {
    final dio = Dio()..interceptors.add(LogInterceptor(responseBody: true));
    dio.options.headers['Authorization'] = 'Token $REPLICATE_API_KEY';
    dio.options.headers['Content-Type'] = 'application/json';
    final bytes = await image.readAsBytes();
    final base64Image = base64Encode(bytes);
    final formDataMap = <String, dynamic>{
      'version':
          '9283608cc6b7be6b65a8e44983db012355fde4132009bf99d976b2f0896856a3',
      'input': {
        'img': 'data:image/jpeg;base64,$base64Image',
      }
    };

    final encodedData = jsonEncode(formDataMap);
    try {
      final response = await dio.post(
        'https://api.replicate.com/v1/predictions',
        data: encodedData,
      );
      final responseData = jsonDecode(
        jsonEncode(response.data),
      );
      final id = responseData['id'] as String;
      final prediction = await getPrediction(predictionId: id);
      debugPrint('Prediction: $prediction');
    } catch (e) {
      // print('Error: $e');
    }
  }

  Future<Map<String, dynamic>> getPrediction({
    required String predictionId,
  }) async {
    final dio = Dio()..interceptors.add(LogInterceptor(responseBody: true));
    dio.options.headers['Authorization'] = 'Token $REPLICATE_API_KEY';
    dio.options.headers['Content-Type'] = 'application/json';
    final response = await dio.get(
      'https://api.replicate.com/v1/predictions/kffwffmm2neklohet57wpydhve',
    );
    final responseData = jsonDecode(
      jsonEncode(response.data),
    );
    final filteredResponse = <String, dynamic>{
      'id': responseData['id'],
      'input': responseData['input'],
      'output': responseData['output'],
      'status': responseData['status'],
    };
    //  debugPrint('Response: $filteredResponse');
    return filteredResponse;
  }

  Future<String> fileToBase64(File file) async {
    final fileBytes = await file.readAsBytes();
    return base64Encode(fileBytes);
  }
}
