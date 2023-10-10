import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
      ),
      home: const MyHomePage(title: 'Musica'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 4.0),
              ),
              child: IconButton(
                iconSize: 64,
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  player.play(AssetSource('audio.mp3'));
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Click play to start listening',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: () {
                    player.stop();
                  },
                ),
                SizedBox(width: 32.0),
                IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: () {
                    player.pause();
                  },
                ),
                SizedBox(width: 32.0),
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {
                    player.resume();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
