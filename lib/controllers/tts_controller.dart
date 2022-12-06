import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:speakup/controllers/settings_controller.dart';
import 'package:speakup/utils/supported_lang.dart';

class TTSController extends GetxController {
  FlutterTts flutterTts = FlutterTts();
  SettingsController settingsController = SettingsController();

  setmetadata() {
    flutterTts.setVoice(ttsVoices[settingsController.voice.value +
        "-" +
        settingsController.selectedG.value]!);
    print(ttsVoices[settingsController.voice.value +
        "-" +
        settingsController.selectedG.value]);
  }

  speak(text) {
    flutterTts.speak(text);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }
}
