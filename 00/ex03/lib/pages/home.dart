import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  String userInput = '0';
  String result = '0';

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
            buildScrollableText(userInput),
            const SizedBox(height: 8.0),
            buildScrollableText(result),
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
                      buildButton("=", Colors.green),
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

  Widget buildScrollableText(String text) {
    return Row (
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildButton(String buttonText, Color textColor) {
  return TextButton(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(textColor),
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 96, 125, 139)),
      shape: MaterialStateProperty.all<BeveledRectangleBorder>(
        BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: const BorderSide(color: Colors.white),
        ),
      ),
    ),
    onPressed: () {
      setState(() {
        handleButtonPressed(buttonText);
      });
    },
    child: Text(buttonText),
  );
  }

  void handleButtonPressed(String buttonText) {
    if (buttonText == "AC") {
      userInput = "0";
      result = "0";
    } else if (buttonText == "C") {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
        if (userInput == "") {
          userInput = "0";
        }
      }
    } else if (buttonText == "=") {
      result = calculateResult();
      if (result.endsWith(".0")) {
        result = result.substring(0, result.length - 2);
      }
    } else {
      if (userInput == "0") {
        userInput = buttonText;
      } else {
        userInput += buttonText;
      }
    }
  }

  String calculateResult() {
    try {
      Expression expression = Parser().parse(userInput);
      double evaluation = expression.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }

}
