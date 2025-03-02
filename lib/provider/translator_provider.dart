import 'package:flutter/material.dart';
import '../services/speech_service.dart';
import '../services/translator_service.dart';

class TranslationProvider with ChangeNotifier {
  final TranslationService _translationService = TranslationService();
  final SpeechService _speechService = SpeechService();

  TextEditingController inputController = TextEditingController();
  TextEditingController translatedController = TextEditingController();
  bool isListening = false;
  String selectedLanguage = 'en-US';
  String translationLanguage = "kn"; // Default to Kannada
  String generated = '';
  String translated = '';

  void selectLanguage(language){
    selectedLanguage=language;
    notifyListeners();
  }
  void translateLanguage(language){
    translationLanguage=language;
    notifyListeners();
  }

  Future<void> translateText() async {
    String translatedText = await _translationService.translateText(inputController.text, translationLanguage);
    translatedController.text = translatedText;
    notifyListeners();
  }
  Future<void> translateSpeechText() async {
    String translatedText = await _translationService.translateText(generated, translationLanguage);
    translated = translatedText;
    notifyListeners();
  }

  Future<void> speakTranslatedText() async {
    await _speechService.speakText(translatedController.text, translationLanguage);
  }
  Future<void> speakSpeechTranslatedText() async {
    await _speechService.speakText(translated, translationLanguage);
  }
  Future<void> speakInputText() async {
    await _speechService.speakText(inputController.text, translationLanguage);
  }
  Future<void> toggleListening() async {
    if (!isListening) {
      bool available = await _speechService.startListening((text) {
        generated = text;
        notifyListeners();
      }, selectedLanguage);
      isListening = available;
    } else {
      _speechService.stopListening();
      isListening = false;
    }
    notifyListeners();
  }
}