import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();
  bool isLiked = false;

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
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
            SizedBox(height: 32.0),
            IconButton(
              icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
              onPressed: toggleLike,
              color: isLiked ? Colors.red : Colors.grey,
              iconSize: 48,
            ),
          ],
        ),
      ),
    );
  }
}
