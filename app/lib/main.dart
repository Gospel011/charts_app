import 'package:app/models/poll_model.dart';

import 'package:app/widgets/my_poll_item.dart';
import 'package:app/widgets/my_poll_widget.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> pollMap = {
    "text": "Who do you all think would win today's presidential election?",
    "poll": [
      {
        "option": "Tmothy Eberechukwu",
        "votes": 59,
        "voted": false,
      },
      {
        "option": "Obi Marvellous",
        "votes": 37,
        "voted": false,
      }
    ],
  };

  Poll get poll => Poll(
        text: pollMap['text'] as String,
        options: pollMap['poll'],
      );

  @override
  Widget build(BuildContext context) {
    print(poll);
    print(poll.polls);

    return Scaffold(
      body: Center(
        child: MyPollWidget(poll: poll),
      ),
    );
  }
}
