import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({
    @required this.sender,
    @required this.message,
    this.isMe,
  });

  final String sender;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final borderRight = BorderRadius.only(
      topLeft: Radius.circular(30.0),
      bottomLeft: Radius.circular(30.0),
      bottomRight: Radius.circular(30.0),
    );
    final borderLeft = BorderRadius.only(
      topRight: Radius.circular(30.0),
      bottomLeft: Radius.circular(30.0),
      bottomRight: Radius.circular(30.0),
    );
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            this.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
              borderRadius: this.isMe ? borderRight : borderLeft,
              elevation: 5.0,
              color: this.isMe ? Colors.lightBlueAccent : Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: this.isMe ? Colors.white : Colors.black54,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
