import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speakup/consts/app_colors.dart';
import 'package:speakup/controllers/tts_controller.dart';
import 'package:speakup/models/common_tiles.dart';
import 'package:speakup/views/widgets/user_created_gridview.dart';

class UserCreatedPage extends StatelessWidget {
  const UserCreatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TTSController ttscontroller = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Colors.black),
        backgroundColor: AppColors.bgColor,
      ),
      backgroundColor: AppColors.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(21.0),
            child: Text(
              "User Created",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Type Here!",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(12)))),
            ),
          ),
          Expanded(
              child: userCreatedGridView(context, commonTiles, ttscontroller))
        ],
      ),
    );
  }
}
