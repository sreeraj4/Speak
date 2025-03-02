import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechService {
  final FlutterTts _flutterTts = FlutterTts();
  final stt.SpeechToText _speech = stt.SpeechToText();

  Future<void> speakText(String text, String language) async {
    await _flutterTts.setLanguage(language);
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.speak(text);
  }

  Future<bool> startListening(Function(String) onTextRecognized, String locale) async {
    bool available = await _speech.initialize();
    if (available) {
      _speech.listen(onResult: (val) {
        onTextRecognized(val.recognizedWords);
      }, localeId: locale);
    }
    return available;
  }

  void stopListening() {
    _speech.stop();
  }
}
