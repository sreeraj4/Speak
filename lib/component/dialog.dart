import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talktranslo/component/custom_dropdown.dart';
import 'package:talktranslo/provider/translator_provider.dart';
import 'package:talktranslo/utils/language.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({super.key});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  
  @override
  Widget build(BuildContext context) {
    final translationProvider = Provider.of<TranslationProvider>(context);
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select an Option',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
           CustomDropdown(
              value: translationProvider.selectedLanguage,
              map: talklanguageMap,
              onChanged: (String? newValue) {
                print(newValue!);
                    translationProvider.selectLanguage(newValue);
                  },
            ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {

              Navigator.of(context).pop();
              translationProvider.toggleListening();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}