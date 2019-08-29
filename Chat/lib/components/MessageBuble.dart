import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({@required this.sender, @required this.message});

  final String sender;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
          elevation: 5.0,
          color: Colors.lightBlueAccent,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              '$sender from $sender',
              style: TextStyle(fontSize: 15.0),
            ),
          )),
    );
  }
}
