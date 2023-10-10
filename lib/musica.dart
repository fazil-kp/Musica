import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicaHomePage extends StatefulWidget {
  const MusicaHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MusicaHomePage> createState() => _MusicaHomePageState();
}

class _MusicaHomePageState extends State<MusicaHomePage> {
  final player = AudioPlayer();
  bool isPlaying = false;
  bool isLiked = false;
  String currentAudio = 'audio.mp3'; // Initially set to audio.mp3

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

  void toggleAudio() {
    setState(() {
      if (currentAudio == 'audio.mp3') {
        currentAudio = 'audio2.mp3'; // Switch to audio2.mp3
      } else if (currentAudio == 'audio2.mp3') {
        currentAudio = 'audio3.mp3'; // Switch to audio3.mp3 (add more tracks as needed)
      } else {
        currentAudio = 'audio.mp3'; // Switch back to audio.mp3
      }

      // Stop the player if it's playing
      player.stop();

      // Play the new audio track
      player.play(AssetSource(currentAudio));
      isPlaying = true;
    });
  }

  void togglePlayPause() {
    setState(() {
      if (isPlaying) {
        player.pause();
        isPlaying = false;
      } else {
        player.play(AssetSource(currentAudio));
        isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 8.0),
            ),
            child: IconButton(
              iconSize: 120,
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.green,
              ),
              onPressed: togglePlayPause,
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            'Click play to start listening',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          SizedBox(height: 48.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.stop, color: Colors.white),
                onPressed: () {
                  player.stop();
                  setState(() {
                    isPlaying = false;
                  });
                },
              ),
              SizedBox(width: 32.0),
              IconButton(
                icon: Icon(Icons.pause, color: Colors.white),
                onPressed: () {
                  player.pause();
                  setState(() {
                    isPlaying = false;
                  });
                },
              ),
              SizedBox(width: 32.0),
              IconButton(
                icon: Icon(Icons.play_arrow, color: Colors.white),
                onPressed: () {
                  player.resume();
                  setState(() {
                    isPlaying = true;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 48.0),
          IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: Colors.green,
            ),
            onPressed: toggleLike,
            iconSize: 64,
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: toggleAudio,
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: Text(
              'Skip',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}