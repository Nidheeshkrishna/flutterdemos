import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MusicPlayer(),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<String> _songs = [];

  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

  Future<void> _loadSongs() async {
    try {
      // Get the directory where the music files are stored
      Directory directory = await getApplicationDocumentsDirectory();
      List<FileSystemEntity> files = directory.listSync();

      // Filter out non-music files
      _songs = files
          .where((file) =>
              file is File && file.path.endsWith('.mp3') && file.existsSync())
          .map((file) => file.path)
          .toList();

      setState(() {});
    } catch (e) {
      if (kDebugMode) {
        print('Error loading songs: $e');
      }
    }
  }

  void _playSong(String filePath) {
    _audioPlayer.stop();
    _audioPlayer.play(
      filePath as Source,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_songs[index]),
            onTap: () => _playSong(_songs[index]),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
