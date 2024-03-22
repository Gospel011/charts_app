import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static bool selected = false;
  void _toggleSelected() {
    print("toggleing");
    selected = !selected;

    // setState(() {});
  }

  var poll = {
    "text": "Who do you all think would win today's presidential election?",
    "poll": [
      {
        "option": "Tmothy Eberechukwu",
        "votes": 0,
        "voters": [],
        "_id": "65fd2dd3078302caa2c3683e"
      },
      {
        "option": "Obi Marvellous",
        "votes": 0,
        "voters": [],
        "_id": "65fd2dd3078302caa2c3683f"
      }
    ],
  };

  double percentage = 0.3;

  double get maxWidth => MediaQuery.of(context).size.width;

  final BoxDecoration decoration =
      BoxDecoration(borderRadius: BorderRadius.circular(8));

  TextStyle? get theme => Theme.of(context).textTheme.bodyMedium;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _toggleSelected,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration: decoration.copyWith(
                                color: Colors.grey.shade300),
                            height: 48,
                            width: maxWidth - 32,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration: decoration.copyWith(color: Colors.grey),
                            curve: Curves.easeInOut,
                            height: 48,
                            width: percentage * (maxWidth - 32),
                          ),
                        ),
                      ],
                    ),
                    const Positioned(left: 32, child: Text("Obi marvellous")),
                    Positioned(right: 32, child: Text("${percentage * 100}%"))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          percentage = 0.3;
                          setState(() {});
                        },
                        child: Text("30%")),
                    ElevatedButton(
                        onPressed: () {
                          percentage = 0.6;
                          setState(() {});
                        },
                        child: Text("60%")),
                    ElevatedButton(
                        onPressed: () {
                          percentage = 0.9;
                          setState(() {});
                        },
                        child: Text("90%")),
                    ElevatedButton(
                        onPressed: () {
                          percentage = 1.0;
                          setState(() {});
                        },
                        child: Text("100%")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
