import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/MessageBuble.dart';
import 'package:flash_chat/services/AuthService.dart';
import 'package:flash_chat/services/MessageService.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseUser loggedUser;
  static final message = new TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async {
    try {
      final user = await AuthService.getUser();
      if (user != null) {
        this.loggedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                AuthService.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _MessageStream(
              userEmail: this.loggedUser != null ? this.loggedUser.email : null,
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: message,
                      onChanged: (value) {
                        message.text = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      MessageService.add(
                        message: message.text,
                        sender: this.loggedUser.email,
                      );
                      message.clear();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageStream extends StatelessWidget {
  _MessageStream({this.userEmail});

  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MessageService.stream(),
      builder: (context, snapshop) {
        if (!snapshop.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        var documents = snapshop.data.documents.reversed;
        List<dynamic> messages = documents.map((snap) {
          var text = snap.data['text'];
          var sender = snap.data['sender'];
          return MessageBubble(
            message: text,
            sender: sender,
            isMe: sender == this.userEmail,
          );
        }).toList();
        return Expanded(
            child: ListView(
          children: messages.cast<Widget>(),
          reverse: true,
        ));
      },
    );
  }
}
