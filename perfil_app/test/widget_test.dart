import 'package:flutter_test/flutter_test.dart';

import 'package:perfil_app/main.dart';

void main() {
  testWidgets('Muestra la pantalla de perfil', (WidgetTester tester) async {
    await tester.pumpWidget(const PerfilApp());

    expect(find.text('Mi perfil'), findsOneWidget);
    expect(find.text('Lucía Pérez'), findsOneWidget);
    expect(find.byType(DatoPerfil), findsNWidgets(3));
    expect(find.text('Seguir'), findsOneWidget);
  });
}
