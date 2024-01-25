import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 52, 60),
      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TextField(),
            const SizedBox(height: 8.0),
            const TextField(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton("7", Colors.black),
                      buildButton("8", Colors.black),
                      buildButton("9", Colors.black),
                      buildButton("C", Colors.red),
                      buildButton("AC", Colors.red),
                    ],
                  ),
                  const SizedBox(height: 3.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton("4", Colors.black),
                      buildButton("5", Colors.black),
                      buildButton("6", Colors.black),
                      buildButton("+", Colors.white),
                      buildButton("-", Colors.white),
                    ],
                  ),
                  const SizedBox(height: 3.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton("1", Colors.black),
                      buildButton("2", Colors.black),
                      buildButton("3", Colors.black),
                      buildButton("*", Colors.white),
                      buildButton("/", Colors.white),
                    ],
                  ),
                  const SizedBox(height: 3.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton("0", Colors.black),
                      buildButton(".", Colors.black),
                      buildButton("00", Colors.black),
                      buildButton("=", Colors.white),
                    ],
                  ),
                ],
              ),
              ),
          ],
        )
        )
      );
  }

  AppBar myAppBar() {
    return AppBar(
      title: const Text('Calculator',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 96, 125, 139),
    );
  }

}

Widget buildButton(String buttonText, Color textColor) {
  return TextButton(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(textColor),
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 96, 125, 139)),
    ),
    onPressed: () {
      print("Button pressed: $buttonText");
    },
    child: Text(buttonText),
  );
}

class TextField extends StatelessWidget {
  const TextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '0',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}