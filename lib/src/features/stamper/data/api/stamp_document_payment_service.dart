import 'package:dio/dio.dart';
import 'package:photoreboot/src/features/stamper/data/requests/notch_pay_confirm_request.dart';
import 'package:photoreboot/src/features/stamper/data/requests/notch_pay_init_request.dart';
import 'package:photoreboot/src/features/stamper/data/responses/notch_pay_confirm_response.dart';
import 'package:photoreboot/src/features/stamper/data/responses/notch_pay_initialize_response.dart';

class StampDocumentPaymentService {
  // initialize payment with notch pay
  Future<NotchPayInitResponse> initializePayment(
    Dio dio,
    NotchpayInitRequest request,
  ) async {
    try {
      final response = await dio.post<Response<NotchPayInitResponse>>(
        'payments/initialize/',
        data: request.toMap(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = response.data;
        if (responseBody == null) {
          throw Exception('Initialization of payment failed');
        }
        return NotchPayInitResponse.fromMap(
          responseBody as Map<String, dynamic>,
        );
      } else {
        throw Exception('Request failed => HTTP ${response.statusCode}');
      }
    } on DioError catch (err) {
      if (err.response != null) {
        final responseBody = err.response!.data as Map<String, dynamic>;
        final message = responseBody['message'] as String? ?? 'Unknown error';
        throw Exception('HTTP ${err.response!.statusCode}: $message');
      } else {
        throw Exception('Network error: ${err.message}');
      }
    } catch (err) {
      rethrow;
    }
  }

  // confirm payment with notch pay
  Future<NotchPayConfirmResponse> confirmPayment(
    Dio dio,
    NotchpayConfirmRequest request,
    String reference,
  ) async {
    try {
      final response = await dio.put<Response<NotchPayConfirmResponse>>(
        'payments/$reference',
        queryParameters: {
          'currency': 'XAF',
        },
        data: request.toMap(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = response.data;
        if (responseBody == null) {
          throw Exception('Confirmation of payment failed');
        }
        return NotchPayConfirmResponse.fromMap(
          responseBody as Map<String, dynamic>,
        );
      } else {
        throw Exception('Request failed => HTTP ${response.statusCode}');
      }
    } on DioError catch (err) {
      if (err.response != null) {
        final responseBody = err.response!.data as Map<String, dynamic>;
        final message = responseBody['message'] as String? ?? 'Unknown error';
        throw Exception('HTTP ${err.response!.statusCode}: $message');
      } else {
        throw Exception('Network error: ${err.message}');
      }
    } catch (err) {
      rethrow;
    }
  }
}
