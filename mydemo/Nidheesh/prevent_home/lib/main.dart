import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:audioplayers/audioplayers.dart';

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
  List<FileSystemEntity> musicFiles = [];
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _loadMusicFiles();
  }

  Future<void> _loadMusicFiles() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String musicFolderPath = '${directory.path}/music123';

    // Check if the 'music' directory exists, if not, create it
    if (!Directory(musicFolderPath).existsSync()) {
      Directory(musicFolderPath).createSync(recursive: true);
    }

    setState(() {
      // Get the list of music files in the 'music' directory
      musicFiles = Directory(musicFolderPath!).listSync();
    });
  }

  Future<void> _pickAndAddMusic() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
    );

    if (result != null) {
      List<File> pickedFiles =
          result.paths!.map((path) => File(path!)).toList();

      Directory directory = await getApplicationDocumentsDirectory();
      String musicFolderPath = '${directory.path}/music';

      // Copy the picked music files to the 'music' directory
      for (File pickedFile in pickedFiles) {
        String newFilePath =
            '$musicFolderPath/${pickedFile.path.split('/').last}';
        await pickedFile.copy(newFilePath);
      }

      // Reload the list of music files
      _loadMusicFiles();
    }
  }

  Future<void> _playMusic(File musicFile) async {
   await audioPlayer.play(musicFile.path as Source);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: musicFiles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(musicFiles[index].path.split('/').last),
                  onTap: () {
                  //  _playMusic(musicFiles.first);
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _pickAndAddMusic,
            child: const Text('Pick and Add Music'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
