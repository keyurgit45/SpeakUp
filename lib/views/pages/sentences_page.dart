import 'package:flutter/material.dart';
import 'package:speakup/views/widgets/sentences_page_widgets.dart';

class SentencesPage extends StatelessWidget {
  const SentencesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.all(21.0),
          child: Text(
            "SpeakUp",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(child: gridView(context)),
      ],
    );
  }
}
