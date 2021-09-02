import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:speakup/consts/app_colors.dart';

class SettingsController extends GetxController {
  var maleC = AppColors.blueColor.obs;
  var femaleC = Colors.white.obs;
  var selectedG = "M".obs;

  var voice = "English".obs;
}
