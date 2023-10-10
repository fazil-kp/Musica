import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'musica.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musica - Music Player App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home:  const MyHomePage(title: 'Musica'),
    );
  }
}
