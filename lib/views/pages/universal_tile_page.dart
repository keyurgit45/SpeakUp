import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speakup/consts/app_colors.dart';
import 'package:speakup/controllers/tts_controller.dart';
import 'package:speakup/models/universal_tile_model.dart';
import 'package:speakup/utils/route_helper.dart';
import 'package:speakup/views/widgets/universal_gridview.dart';

//for static sub tiles such as common , numbers
// ignore: must_be_immutable
class UniversalTilePage extends StatelessWidget {
  UniversalTilePage({required this.routename});
  String routename;
  @override
  Widget build(BuildContext context) {
    List<UniversalTile> tilename = getTileName(this.routename);
    TTSController ttscontroller = Get.find();
    ttscontroller.setmetadata();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Colors.black),
        backgroundColor: AppColors.tileColor,
      ),
      body: Container(
        color: AppColors.bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.tileColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, top: 10, bottom: 10),
                child: Text(
                  this.routename,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
                child: universalGridView(context, tilename,
                    ttscontroller)) //to be changed today // try to make all pages in one file
          ],
        ),
      ),
    );
  }
}
