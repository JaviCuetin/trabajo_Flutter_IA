import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ejercicio3_contador/main.dart';

void main() {
  testWidgets('El contador suma al pulsar', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: Center(child: Contador()))),
    );

    expect(find.text('Pulsaciones: 0'), findsOneWidget);
    expect(find.text('Total: 0'), findsOneWidget);

    for (var i = 0; i < 3; i++) {
      await tester.tap(find.text('Sumar'));
      await tester.pump();
    }

    expect(find.text('Pulsaciones: 3'), findsOneWidget);
    expect(find.text('Total: 3'), findsOneWidget);
  });
}
