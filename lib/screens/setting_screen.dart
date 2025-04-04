import 'package:flutter/material.dart';
import 'package:talktranslo/screens/abouthelp_screen.dart';
import 'package:talktranslo/screens/speechsetting_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.mic),
            title: Text('Speech setting'),
            trailing: Icon(Icons.more_vert),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SpeechSettingScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.question_mark),
            title: Text('About and Help'),
            trailing: Icon(Icons.more_vert),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AbouthelpScreen()));
            },
          ),
        ],
      ),
    );
  }
}
