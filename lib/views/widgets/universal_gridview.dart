import 'package:flutter/material.dart';
import 'package:speakup/controllers/tts_controller.dart';
import 'package:speakup/models/universal_tile_model.dart';
import 'package:speakup/utils/route_helper.dart';

Widget universalGridView(
        context, List<UniversalTile> tile, TTSController ttsController) =>
    GridView.count(
      crossAxisSpacing: isAlphabetTile(tile[0].title) ? 5 : 15,
      mainAxisSpacing: 15,
      crossAxisCount: isAlphabetTile(tile[0].title) ? 3 : 2,
      childAspectRatio: isExplanationTile(tile[0].title) ? 1 : 2 / 1,
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
                          style: TextStyle(
                              fontSize:
                                  isAlphabetTile(tile[0].title) ? 18 : 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(e.title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize:
                                    isExplanationTile(tile[0].title) ? 18 : 20,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
