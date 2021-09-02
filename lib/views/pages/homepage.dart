import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speakup/consts/app_colors.dart';
import 'package:speakup/controllers/tts_controller.dart';
import 'package:speakup/views/pages/pages_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // ignore: unused_local_variable
    TTSController controller = Get.put(TTSController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget bottomNavBar() => BottomNavigationBar(
        backgroundColor: AppColors.navBarColor,
        selectedItemColor: AppColors.blueColor,
        // unselectedItemColor: Color(0xFF969696),
        items: [
          BottomNavigationBarItem(
              label: "Sentences", icon: Icon(Icons.speaker_notes_outlined)),
          BottomNavigationBarItem(
              label: "Phone", icon: Icon(Icons.phone_outlined)),
          BottomNavigationBarItem(
              label: "Settings", icon: Icon(Icons.settings_outlined))
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
      );
}
