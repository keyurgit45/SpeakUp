import 'package:flutter/material.dart';
import 'package:speakup/controllers/tts_controller.dart';
import 'package:speakup/models/universal_tile_model.dart';

Widget userCreatedGridView(
        context, List<UniversalTile> tile, TTSController ttsController) =>
    GridView.count(
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      childAspectRatio: 2 / 1,
      padding: EdgeInsets.all(15),
      children: tile
          .map((e) => GestureDetector(
                onTap: () {
                  ttsController.speak(e.title);
                },
                child: Container(
                  height: 50,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 8.0),
                        child: Text(
                          e.emoji,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(e.title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
