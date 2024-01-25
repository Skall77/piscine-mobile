import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homeText = "A simple text";

  void changeText() {
    setState(() {
      if (homeText == "A simple text") {
        homeText = "Hello World!";
      } else {
        homeText = "A simple text";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                homeText,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 44, 11, 176)),
                ),
                onPressed: () {
                  changeText();
                },
                child: const Text('Click Me'),
              )
            ],
          ),
        )
    );
  }
}