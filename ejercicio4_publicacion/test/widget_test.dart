import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ejercicio4_publicacion/main.dart';

void main() {
  testWidgets('Me gusta y Reiniciar', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: PantallaPublicacion()));

    expect(find.text('A 12 personas les gusta esto'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    await tester.tap(find.byType(IconButton));
    await tester.pump();
    expect(find.text('A 13 personas les gusta esto'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    await tester.tap(find.byType(IconButton));
    await tester.pump();
    expect(find.text('A 12 personas les gusta esto'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    await tester.tap(find.byType(IconButton));
    await tester.pump();
    await tester.tap(find.text('Reiniciar'));
    await tester.pump();
    expect(find.text('A 0 personas les gusta esto'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
  });
}
