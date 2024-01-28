// import 'package:audioplayers/audioplayers.dart';
import 'dart:io';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ConfettiController();
  late var _player = AudioPlayer();
  // _player.setLoopMode(LoopMode.one);
  // Future<void> get loopMode => _player.setLoopMode(LoopMode.one);
  // _player.setAudioSource(AudioSource.uri(Uri.parse('asset:/your_file.mp3'));
  // final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer()..setAsset('assets/favour.wav');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    // player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('Happy Holi', textAlign: TextAlign.center),
            backgroundColor: Colors.deepPurple,
          ),
          body: Center(
              child: MaterialButton(
            onPressed: () async {
              if (isPlaying) {
                _controller.stop();
                _player.stop();
                // await player.stop();
              } else {
                _controller.play();
                _player.setLoopMode(LoopMode.one);
                _player.play();
                
                
                // await player.setSourceAsset('sound/favour.wav');
                // await player.resume();
                // player.play(AssetSource('lib/favour.wav'));
              }
              isPlaying = !isPlaying;
            },
            child: Text('Surprise'),
            color: Colors.deepPurple[200],
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: ()=> exit(0),
            tooltip: 'Close app',
            child: new Icon(Icons.exit_to_app),
            backgroundColor: Colors.deepPurple,
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          blastDirectionality: BlastDirectionality.explosive,
          blastDirection: pi / 2,
          shouldLoop: true,
          numberOfParticles: 5,
          maxBlastForce: 40,
          gravity: 0.16,
          emissionFrequency: 0.15,
        ),
      ],
    );
  }
}
