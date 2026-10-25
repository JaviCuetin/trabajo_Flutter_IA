import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ejercicio2_estado/main.dart';

void main() {
  testWidgets('El botón cambia toda la pantalla a modo oscuro',
      (WidgetTester tester) async {
    await tester.pumpWidget(const InterruptorModoOscuro());

    Brightness brillo() =>
        Theme.of(tester.element(find.byType(Scaffold))).brightness;

    expect(find.text('Modo oscuro: desactivado'), findsOneWidget);
    expect(brillo(), Brightness.light);

    await tester.tap(find.text('Activar'));
    await tester.pumpAndSettle();

    expect(find.text('Modo oscuro: activado'), findsOneWidget);
    expect(find.text('Desactivar'), findsOneWidget);
    expect(brillo(), Brightness.dark);

    await tester.tap(find.text('Desactivar'));
    await tester.pumpAndSettle();

    expect(find.text('Modo oscuro: desactivado'), findsOneWidget);
    expect(brillo(), Brightness.light);
  });
}
