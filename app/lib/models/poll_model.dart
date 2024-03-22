// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app/models/poll_items.dart';

class Poll {
  // text
  final String text;

  // list of poll items
  final List<Map<String, dynamic>> options;

  Poll({
    required this.text,
    required this.options,
  });

  int get totalVotes {
    int votes = 0;

    for (Map option in options) {
      votes += option['votes'] as int;
    }

    return votes;
  }

  double getPollPercentage(int votes) {
    return votes == 0 ? 0 : votes / totalVotes;
  }

  // PollItems({required this.option, required this.voted, required this.percentage});

  List<PollItems> get polls => List.from(options.map((poll) {
        poll['percentage'] = getPollPercentage(poll['votes']);

        return PollItems.fromMap(poll);
      }));

  @override
  String toString() => 'Poll(text: $text, options: $options)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'options': options,
    };
  }

  
  Poll copyWith({
    String? text,
    List<Map<String, dynamic>>? options,
  }) {
    return Poll(
      text: text ?? this.text,
      options: options ?? this.options,
    );
  }
}
