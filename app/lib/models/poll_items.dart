// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PollItems {
  // option
  final String option;

  // votes
  // final int votes;

  // voted
  final bool voted;

  // percentage;
  final double percentage;

  PollItems({required this.option, required this.voted, required this.percentage});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'option': option,
      'voted': voted,
      'percentage': percentage,
    };
  }

  factory PollItems.fromMap(Map<String, dynamic> map) {
    return PollItems(
      option: map['option'] as String,
      voted: map['voted'] as bool,
      percentage: map['percentage'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PollItems.fromJson(String source) =>
      PollItems.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PollItems(option: $option, voted: $voted, percentage: $percentage)';
}
