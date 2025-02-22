import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerScreen extends StatefulWidget {
  final String videoKey;

  const TrailerScreen({required this.videoKey, Key? key}) : super(key: key);

  @override
  TrailerScreenState createState() => TrailerScreenState();
}

class TrailerScreenState extends State<TrailerScreen> {
  late YoutubePlayerController _controller;
  // Initializing the Youtube player controller with the given settings before building the widget tree
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Using YoutubePlayerBuilder to use both full screen and normal screen mode
    return YoutubePlayerBuilder(
      // Using the YouTubePlayer widget with the initialized controller
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.redAccent,
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade800,
            title: const Text("Trailer", style: TextStyle(color: Colors.white)),
          ),
          body: Column(
            children: [
              // Using Expanded to stretch the player to fill available vertical space.
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.black),
                  child: player,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  //Dispose controller after use
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
