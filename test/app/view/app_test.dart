import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:photoreboot/app/app.dart';

void main() {
  group('Basic app test', () {
    testWidgets('renders material app widget', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
