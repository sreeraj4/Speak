import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/translator_provider.dart';
import '../utils/language.dart';

class SpeechSettingScreen extends StatefulWidget {
  const SpeechSettingScreen({super.key});

  @override
  State<SpeechSettingScreen> createState() => _SpeechSettingScreenState();
}

class _SpeechSettingScreenState extends State<SpeechSettingScreen> {

  @override
  Widget build(BuildContext context) {
    final translationProvider = Provider.of<TranslationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Speech Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Speech Rate: ${translationProvider.speechRate.toStringAsFixed(1)}"),
            Slider(
              value: translationProvider.speechRate,
              divisions: 10,
              label:translationProvider.speechRate.toString(),
              min: 0.5,
              max: 2.0,
              activeColor: Colors.blue,
              onChanged: (value) {
                translationProvider.selectSpeedRate(value);
              },
            ),
            Text("Pitch: ${translationProvider.pitch.toStringAsFixed(1)}"),
            Slider(
              value: translationProvider.pitch,
              divisions: 10,
              label:translationProvider.pitch.toString(),
              activeColor: Colors.blue,
              min: 0.5,
              max: 2.0,
              onChanged: (value) {
                translationProvider.selectPitch(value);
              },
            ),
            Text("Voice",style: TextStyle(fontWeight: FontWeight.bold),),
            DropdownButton<String>(
              value: translationProvider.selectedVoice,
              onChanged: (value) {
                translationProvider.selectVoice(value);
              },
              items: availableVoices.map((voice) {
                return DropdownMenuItem<String>(
                  value: voice["value"],
                  child: Text(voice["name"]!),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
