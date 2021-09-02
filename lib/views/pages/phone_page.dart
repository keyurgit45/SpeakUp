import 'package:flutter/material.dart';
import 'package:speakup/consts/app_colors.dart';
import 'package:speakup/controllers/tts_controller.dart';
import 'package:speakup/views/widgets/sentences_page_widgets.dart';

// ignore: must_be_immutable
class PhonePage extends StatefulWidget {
  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final TextEditingController textEditingController = TextEditingController();
  final TTSController ttsController = TTSController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColors.blueColor,
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(21.0),
                child: Text(
                  "🤖",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 21.0, right: 21.0, top: 10.0, bottom: 25.0),
                child: Text(
                  "I will use Text to Speech to talk to you",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.tileColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: textEditingController,
            onFieldSubmitted: (str) {
              ttsController.flutterTts.speak(textEditingController.text);
              textEditingController.clear();
            },
            decoration: InputDecoration(
              hintText: "Type what you want to say",
            ),
          ),
        ),
        Expanded(child: gridView(context)),
      ],
    );
  }
}
