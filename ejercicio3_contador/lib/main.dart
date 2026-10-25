import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(body: Center(child: Contador())),
    ),
  );
}

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int pulsaciones = 0;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Pulsaciones: $pulsaciones'),
        Text('Total: $total'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              pulsaciones++;
              total++;
            });
          },
          child: const Text('Sumar'),
        ),
      ],
    );
  }
}
