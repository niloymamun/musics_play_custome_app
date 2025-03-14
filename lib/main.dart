import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SoundPlayerScreen());
  }
}

class SoundPlayerScreen extends StatefulWidget {
  const SoundPlayerScreen({super.key});

  @override
  _SoundPlayerScreenState createState() => _SoundPlayerScreenState();
}

class _SoundPlayerScreenState extends State<SoundPlayerScreen> {
  // Create an instance of the audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Function to play the custom sound
  // void _playSound() async {
  //   try {
  //     // Load and play the sound file
  //     await _audioPlayer.play(AssetSource('sounds/notification.mp3'));
  //   } catch (e) {
  //     print("Error playing sound: $e");
  //   }
  // }

  // new function

  Future<void> myPlaySound(String sound) async {
    await _audioPlayer.play(AssetSource(sound));
  }

  Widget myButton(Color color, String sound) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(),
        ),
        onPressed: () async {
          await myPlaySound(sound);
        },
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Musics Play Apps')),
      body: Column(
        children: [
          myButton(Colors.red, 'sounds/note1.wav'),
          myButton(Colors.orange, 'sounds/note2.wav'),
          myButton(Colors.yellow, 'sounds/note3.wav'),
          myButton(Colors.green, 'sounds/note4.wav'),
          myButton(Colors.teal, 'sounds/note5.wav'),
          myButton(Colors.blue, 'sounds/note6.wav'),
          myButton(Colors.purple, 'sounds/note7.wav'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the audio player when not in use
    _audioPlayer.dispose();
    super.dispose();
  }
}
