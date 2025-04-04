import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talktranslo/component/texticon_button.dart';
import 'package:talktranslo/utils/language.dart';
import 'package:talktranslo/component/custom_dropdown.dart';
import 'package:flutter/services.dart';
import '../provider/translator_provider.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  void copyContent(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final translationProvider = Provider.of<TranslationProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomDropdown(
                  value: translationProvider.selectedLanguage,
                  map: talklanguageMap,
                  onChanged: (String? newValue) {
                    translationProvider.selectLanguage(newValue!);
                  },
                ),
                Icon(Icons.repeat),
                CustomDropdown(
                  value: translationProvider.translationLanguage,
                  map: languageMap,
                  onChanged: (String? newValue) {
                    translationProvider.translateLanguage(newValue!);
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.white70,
              shadowColor: Colors.grey,
              elevation: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              copyContent(
                                  translationProvider.inputController.text);
                            },
                            icon: Icon(Icons.copy),
                            iconSize: 20),
                        IconButton(
                            onPressed: () {
                              translationProvider.speakInputText();
                            },
                            icon: Icon(Icons.volume_up),
                            iconSize: 20),
                      ]),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your text here',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    maxLines: 6,
                    controller: translationProvider.inputController,
                  ),
                ],
              ),
            ),
          ),
          TextIconButton(
              onPress: () {
                translationProvider.translateText();
              },
              label: "Translate",
              icon: Icons.translate),
          // ElevatedButton(onPressed: translatedText, child: Text("Translate")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.white70,
              shadowColor: Colors.grey,
              elevation: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            copyContent(
                                translationProvider.translatedController.text);
                          },
                          icon: Icon(Icons.copy),
                          iconSize: 20),
                      IconButton(
                          onPressed: () {
                            translationProvider.speakTranslatedText();
                          },
                          icon: Icon(Icons.volume_up),
                          iconSize: 20),
                    ],
                  ),
                  // IconButton(onPressed:(){ speak(translatedController.text);}, icon: Icon(Icons.record_voice_over), iconSize: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Translation',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    readOnly: true,
                    maxLines: 6,
                    controller: translationProvider.translatedController,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    ));
  }
}
