import 'package:app/models/poll_model.dart';
import 'package:app/widgets/my_poll_item.dart';
import 'package:flutter/material.dart';


class MyPollWidget extends StatefulWidget {
  const MyPollWidget({
    super.key,
    required this.poll,
  });

  final Poll poll;

  @override
  State<MyPollWidget> createState() => _MyPollWidgetState();
}

class _MyPollWidgetState extends State<MyPollWidget> {
  late Poll poll;

  @override
  void initState() {
    super.initState();
    poll = widget.poll.copyWith();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(poll.text, style: TextStyle(fontSize: 18),),
        ),

        const SizedBox(
          height: 4,
        ),
        ...List<Widget>.generate(poll.polls.length, (index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: GestureDetector(
                  onTap: () {
                    vote(index);
                  },
                  child: MyPollItem(item: poll.polls[index])),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: GestureDetector(
                  onTap: () {
                    vote(index);
                  },
                  child: MyPollItem(item: poll.polls[index])),
            );
          }
        }),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Text("${poll.totalVotes} votes")
          ],),
        )
      ],
    );
  }

  void vote(int index) {
    var pollOption = poll.options[index];

    if (pollOption["voted"] == true) {
      pollOption['votes'] -= 1;
    } else {
      int i = 0;

      removePreviousVote(i);

      poll.options[index]['votes'] += 1;
    }

    poll.options[index]['voted'] = !poll.options[index]['voted'];

    print(poll.options);

    setState(() {});
  }

  void removePreviousVote(int i) {
    for (var option in poll.options) {
      if (poll.options[i]['voted'] == true) {
        print("voted ${poll.options[i]['option']}");
        poll.options[i]['votes'] -= 1;
        poll.options[i]['voted'] = false;
      }
    
      i++;
    }
  }
}
