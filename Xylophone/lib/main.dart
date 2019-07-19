import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  _renderButton(Color color, String sound) {
    return Expanded(
      child: FlatButton(
        child: null,
        color: color,
        onPressed: () {
          player.play(sound);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _renderButton(Colors.red, 'note1.wav'),
          _renderButton(Colors.orange, 'note2.wav'),
          _renderButton(Colors.yellow, 'note3.wav'),
          _renderButton(Colors.green, 'note4.wav'),
          _renderButton(Colors.greenAccent, 'note5.wav'),
          _renderButton(Colors.blue, 'note6.wav'),
          _renderButton(Colors.purple, 'note7.wav'),
        ],
      )),
    ));
  }
}
