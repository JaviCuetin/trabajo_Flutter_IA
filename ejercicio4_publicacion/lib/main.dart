import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PantallaPublicacion()));
}

class PantallaPublicacion extends StatefulWidget {
  const PantallaPublicacion({super.key});

  @override
  State<PantallaPublicacion> createState() => _PantallaPublicacionState();
}

class _PantallaPublicacionState extends State<PantallaPublicacion> {
  bool meGusta = false;
  int contador = 12;

  void _alternarMeGusta() {
    setState(() {
      if (meGusta) {
        contador--;
      } else {
        contador++;
      }
      meGusta = !meGusta;
    });
  }

  void _reiniciar() {
    setState(() {
      contador = 0;
      meGusta = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Publicación')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              color: Colors.pink.shade50,
              child: const Center(
                child: Icon(Icons.image, size: 64, color: Colors.pink),
              ),
            ),
            const SizedBox(height: 16),
            BotonMeGusta(meGusta: meGusta, alPulsar: _alternarMeGusta),
            TextoContador(contador: contador),
            const SizedBox(height: 16),
            BotonReiniciar(alReiniciar: _reiniciar),
          ],
        ),
      ),
    );
  }
}

class BotonMeGusta extends StatelessWidget {
  final bool meGusta;
  final VoidCallback alPulsar;

  const BotonMeGusta({
    super.key,
    required this.meGusta,
    required this.alPulsar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: alPulsar,
          icon: Icon(
            meGusta ? Icons.favorite : Icons.favorite_border,
            color: Colors.pink,
          ),
        ),
        const Text('Me gusta'),
      ],
    );
  }
}

class TextoContador extends StatelessWidget {
  final int contador;

  const TextoContador({super.key, required this.contador});

  @override
  Widget build(BuildContext context) {
    return Text(
      'A $contador personas les gusta esto',
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class BotonReiniciar extends StatelessWidget {
  final VoidCallback alReiniciar;

  const BotonReiniciar({super.key, required this.alReiniciar});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: alReiniciar,
      child: const Text('Reiniciar'),
    );
  }
}
