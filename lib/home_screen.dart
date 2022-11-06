import 'package:calculator_app/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        answer.toString(),
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Whenerver user click on AC button everthing will be deleted
                        MyButton(
                            title: 'AC',
                            onPress: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            }),
                        MyButton(
                            title: '+/-',
                            onPress: () {
                              setState(() {
                                userInput += '+/-';
                              });
                            }),
                        MyButton(
                            title: '%',
                            onPress: () {
                              setState(() {
                                userInput += '%';
                              });
                            }),
                        MyButton(
                          title: '/',
                          onPress: () {
                            setState(() {
                              userInput += '/';
                            });
                          },
                          color: Colors.orange,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '7',
                            onPress: () {
                              setState(() {
                                userInput += '7';
                              });
                            }),
                        MyButton(
                            title: '8',
                            onPress: () {
                              setState(() {
                                userInput += '8';
                              });
                            }),
                        MyButton(
                            title: '0',
                            onPress: () {
                              setState(() {
                                userInput += '0';
                              });
                            }),
                        MyButton(
                          title: 'x',
                          onPress: () {
                            setState(() {
                              userInput += 'x';
                            });
                          },
                          color: Colors.orange,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '4',
                            onPress: () {
                              setState(() {
                                userInput += '4';
                              });
                            }),
                        MyButton(
                            title: '5',
                            onPress: () {
                              setState(() {
                                userInput += '5';
                              });
                            }),
                        MyButton(
                            title: '6',
                            onPress: () {
                              setState(() {
                                userInput += '6';
                              });
                            }),
                        MyButton(
                          title: '-',
                          onPress: () {
                            setState(() {
                              userInput += '-';
                            });
                          },
                          color: Colors.orange,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '1',
                            onPress: () {
                              setState(() {
                                userInput += '1';
                              });
                            }),
                        MyButton(
                            title: '2',
                            onPress: () {
                              setState(() {
                                userInput += '2';
                              });
                            }),
                        MyButton(
                            title: '3',
                            onPress: () {
                              setState(() {
                                userInput += '3 ';
                              });
                            }),
                        MyButton(
                          title: '+',
                          onPress: () {
                            setState(() {
                              userInput += '+';
                            });
                          },
                          color: Colors.orange,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '0',
                            onPress: () {
                              setState(() {
                                userInput += '0';
                              });
                            }),
                        MyButton(
                            title: '.',
                            onPress: () {
                              setState(() {
                                userInput += '.';
                              });
                            }),
                        MyButton(
                            title: 'DEL',
                            onPress: () {
                              setState(() {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              });
                            }),
                        MyButton(
                          title: '=',
                          onPress: () {
                            setState(() {
                              equalPress();
                            });
                          },
                          color: Colors.orange,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    // If we find x in the userInput then we will replace it by *
    String finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();

    // We will get our expression and parse it

    Expression expression = p.parse(finalUserInput);

// The context model keeps track of all known variables and functions.
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toStringAsFixed(2);
  }
}
