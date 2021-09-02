import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speakup/consts/app_colors.dart';
import 'package:speakup/controllers/settings_controller.dart';
import 'package:speakup/controllers/tts_controller.dart';
import 'package:speakup/utils/supported_lang.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TTSController ttscontroller = Get.find();
  SettingsController settingsController = SettingsController();

  void previewVoice() {
    ttscontroller.flutterTts.setVoice(ttsVoices[settingsController.voice.value +
        "-" +
        settingsController.selectedG.value]!);
    ttscontroller.flutterTts.speak("This is an example voice.");
  }

  void changeGender(String gender) {
    if (gender == "Male") {
      settingsController.maleC.value = AppColors.blueColor;
      settingsController.femaleC.value = Colors.white;
      settingsController.selectedG.value = "M";
    } else {
      settingsController.maleC.value = Colors.white;
      settingsController.femaleC.value = AppColors.blueColor;
      settingsController.selectedG.value = "Fe";
    }
  }

  @override
  void dispose() {
    super.dispose();
    settingsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(settingsController.selectedG.value);
    return Container(
      color: AppColors.bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(21.0),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Container(
              height: 100,
              width: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "💬",
                          style: TextStyle(fontSize: 23),
                        ),
                        SizedBox(
                          width: 185,
                        ),
                        Text(
                          "❤",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text("Example Text",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              height: 120,
              width: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          genderButton("Male", settingsController.maleC.value),
                          genderButton(
                              "Female", settingsController.femaleC.value)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 45.0, top: 15),
                        child: customDropDown(),
                      )
                    ],
                  )),
            ),
          ),
          SizedBox(height: 25),
          Center(
              child: CupertinoButton(
                  color: AppColors.blueColor,
                  child: Text("Preview Voice"),
                  onPressed: () {
                    previewVoice();
                  }))
        ],
      ),
    );
  }

  Widget customDropDown() => DropdownButton<String>(
        items: <String>[
          "English",
          "Hindi",
          "French",
          "Thai",
          "Polish",
          "Spanish"
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text(
          settingsController.voice.value,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        style: TextStyle(color: Colors.green[900]),
        value: settingsController.voice.value,
        onChanged: (_value) {
          settingsController.voice.value = _value!;
        },
      );

  Widget genderButton(String gender, Color color) => GestureDetector(
        onTap: () {
          changeGender(gender);
        },
        child: Container(
          width: 90,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: color),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(
                  color: color == AppColors.blueColor
                      ? Colors.white
                      : AppColors.blueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
}
