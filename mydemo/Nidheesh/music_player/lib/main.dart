import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AudioPlayerScreen(),
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer player = AudioPlayer();
  // Define your playlist of audio URLs
  final List<String> playlist = [
    'assets/FriDay/Mazhaye-Thoomazhaye(PaglaSongs).mp3',
    'assets/FriDay/Neela-Nilave(PaglaSongs).mp3',
    'assets/FriDay/Mazhaye-Thoomazhaye(PaglaSongs).mp3',
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  Future<void> initPlayer() async {
    await player.setAudioSource(
      ConcatenatingAudioSource(
        children: playlist.map((url) => AudioSource.asset(url)).toList(),
      ),
      initialIndex: 0,
      // Add other options as needed
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Now Playing: ${playlist[currentIndex]}'),
            ElevatedButton(
              onPressed: () {
                player.play();
              },
              child: const Text('Play'),
            ),
            ElevatedButton(
              onPressed: () {
                player.pause();
              },
              child: const Text('Pause'),
            ),
            ElevatedButton(
              onPressed: () {
                player.seekToNext();
                setState(() {
                  currentIndex = (currentIndex + 1) % playlist.length;
                });
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
