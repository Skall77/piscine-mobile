import 'package:flutter/material.dart';

class CurrentlyPage extends StatelessWidget {
  final String input;
  final bool geo;

  const CurrentlyPage({Key? key, required this.input, required this.geo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Currently',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              geo ? 'Geolocation' : input,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        )
    );
  }
}