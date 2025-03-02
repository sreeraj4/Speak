import 'package:translator/translator.dart';

class TranslationService {
  final GoogleTranslator _translator = GoogleTranslator();

  Future<String> translateText(String text, String targetLanguage) async {
    if (text.isEmpty) return "";
    Translation translation = await _translator.translate(text, to: targetLanguage);
    return translation.text;
  }
}