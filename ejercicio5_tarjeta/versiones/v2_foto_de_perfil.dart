import 'package:flutter/material.dart';

void main() {
  runApp(const TarjetaApp());
}

class TarjetaApp extends StatelessWidget {
  const TarjetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarjeta de presentación',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const TarjetaPresentacion(),
    );
  }
}

/// Único StatefulWidget: guarda si el usuario está siguiendo o no.
class TarjetaPresentacion extends StatefulWidget {
  const TarjetaPresentacion({super.key});

  @override
  State<TarjetaPresentacion> createState() => _TarjetaPresentacionState();
}

class _TarjetaPresentacionState extends State<TarjetaPresentacion> {
  bool siguiendo = false;

  void _alternarSeguir() {
    setState(() {
      siguiendo = !siguiendo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarjeta de presentación')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/foto_perfil.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Javier García',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Text('Estudiante de 2.º DAM'),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DatoTarjeta(valor: '12', etiqueta: 'Proyectos'),
                DatoTarjeta(valor: '370', etiqueta: 'Horas de prácticas'),
                DatoTarjeta(valor: '5', etiqueta: 'Lenguajes'),
              ],
            ),
            const SizedBox(height: 24),
            BotonSeguir(siguiendo: siguiendo, alPulsar: _alternarSeguir),
          ],
        ),
      ),
    );
  }
}

/// Parte que se repite tres veces: recibe sus datos por el constructor.
class DatoTarjeta extends StatelessWidget {
  final String valor;
  final String etiqueta;

  const DatoTarjeta({super.key, required this.valor, required this.etiqueta});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          valor,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(etiqueta),
      ],
    );
  }
}

/// Botón sin estado: muestra «Seguir» o «Siguiendo» según lo que recibe.
class BotonSeguir extends StatelessWidget {
  final bool siguiendo;
  final VoidCallback alPulsar;

  const BotonSeguir({
    super.key,
    required this.siguiendo,
    required this.alPulsar,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: alPulsar,
      icon: Icon(siguiendo ? Icons.check : Icons.person_add),
      label: Text(siguiendo ? 'Siguiendo' : 'Seguir'),
    );
  }
}
