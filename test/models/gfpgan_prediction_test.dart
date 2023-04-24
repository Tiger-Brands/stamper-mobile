// ignore_for_file: missing_whitespace_between_adjacent_strings, avoid_dynamic_calls

import 'package:flutter_test/flutter_test.dart';
import 'package:photoreboot/src/data/models/gfpgan_prediction.dart';

void main() {
  group('GfpganPrediction', () {
    final expected = GfpganPrediction(
      error: 'error message',
      input: 'input data',
      status: 'completed',
      version: 'v1.0.0',
      output: 'output data',
      metrics: 'some metrics',
      logs: 'some logs',
      id: '12345',
      createdAt: '2022-04-23T15:35:12.000Z',
      startedAt: '2022-04-23T15:35:15.000Z',
      completedAt: '2022-04-23T15:36:28.000Z',
    );

    test('fromJson and toJson', () {
      final jsonString = expected.toJson();
      final actual = GfpganPrediction.fromJson(jsonString);

      expect(actual, equals(expected));
    });

    test('toMap and fromMap', () {
      final jsonMap = expected.toMap();
      final actual = GfpganPrediction.fromMap(jsonMap);

      expect(actual, equals(expected));
    });

    test('copyWith', () {
      final actual = expected.copyWith(
        error: 'new error',
        status: 'failed',
        id: '54321',
      );

      expect(actual.error, equals('new error'));
      expect(actual.status, equals('failed'));
      expect(actual.id, equals('54321'));
      expect(actual.input, equals(expected.input));
      expect(actual.output, equals(expected.output));
      expect(actual.metrics, equals(expected.metrics));
      expect(actual.logs, equals(expected.logs));
      expect(actual.version, equals(expected.version));
      expect(actual.createdAt, equals(expected.createdAt));
      expect(actual.startedAt, equals(expected.startedAt));
      expect(actual.completedAt, equals(expected.completedAt));
    });

    test('toString', () {
      final actual = expected.toString();
      const expectedString = 'GfpganPrediction('
          'error: error message, '
          'input: input data, '
          'status: completed, '
          'version: v1.0.0, '
          'output: output data, '
          'metrics: some metrics, '
          'logs: some logs, '
          'id: 12345, '
          'createdAt: 2022-04-23T15:35:12.000Z, '
          'startedAt: 2022-04-23T15:35:15.000Z, '
          'completedAt: 2022-04-23T15:36:28.000Z'
          ')';

      expect(actual, equals(expectedString));
    });
  });
}
