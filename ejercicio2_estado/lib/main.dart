import 'package:flutter/material.dart';

void main() {
  runApp(const InterruptorModoOscuro());
}

/// Widget 2 (CON estado): guarda si el modo oscuro está activado
/// y cambia el tema de toda la aplicación.
class InterruptorModoOscuro extends StatefulWidget {
  const InterruptorModoOscuro({super.key});

  @override
  State<InterruptorModoOscuro> createState() => _InterruptorModoOscuroState();
}

class _InterruptorModoOscuroState extends State<InterruptorModoOscuro> {
  // Esta variable es el ESTADO del widget.
  bool _modoOscuro = false;

  void _alternar() {
    setState(() {
      _modoOscuro = !_modoOscuro;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _modoOscuro ? ThemeMode.dark : ThemeMode.light,
      home: PantallaEjercicio2(modoOscuro: _modoOscuro, alCambiar: _alternar),
    );
  }
}

/// Pantalla (sin estado): recibe el valor y la función de su padre.
class PantallaEjercicio2 extends StatelessWidget {
  final bool modoOscuro;
  final VoidCallback alCambiar;

  const PantallaEjercicio2({
    super.key,
    required this.modoOscuro,
    required this.alCambiar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateless y Stateful')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              modoOscuro ? Icons.dark_mode : Icons.light_mode,
              size: 64,
            ),
            const SizedBox(height: 12),
            Text(
              modoOscuro ? 'Modo oscuro: activado' : 'Modo oscuro: desactivado',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            // El hijo (sin estado) avisa al padre con la función que recibe.
            BotonAccion(
              texto: modoOscuro ? 'Desactivar' : 'Activar',
              alPulsar: alCambiar,
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget 6 (SIN estado): no guarda nada que cambie.
/// Recibe el texto y la función a ejecutar por el constructor.
class BotonAccion extends StatelessWidget {
  final String texto;
  final VoidCallback alPulsar;

  const BotonAccion({super.key, required this.texto, required this.alPulsar});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: alPulsar, child: Text(texto));
  }
}
