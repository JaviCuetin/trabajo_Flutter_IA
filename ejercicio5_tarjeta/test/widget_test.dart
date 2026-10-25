import 'package:flutter_test/flutter_test.dart';

import 'package:ejercicio5_tarjeta/main.dart';

void main() {
  testWidgets('El botón alterna entre Seguir y Siguiendo', (tester) async {
    await tester.pumpWidget(const TarjetaApp());

    expect(find.text('Seguir'), findsOneWidget);
    expect(find.text('Siguiendo'), findsNothing);
    expect(find.byType(DatoTarjeta), findsNWidgets(3));

    await tester.tap(find.text('Seguir'));
    await tester.pump();
    expect(find.text('Siguiendo'), findsOneWidget);

    await tester.tap(find.text('Siguiendo'));
    await tester.pump();
    expect(find.text('Seguir'), findsOneWidget);
  });
}
