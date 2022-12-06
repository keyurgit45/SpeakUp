//homepage-sentences-phone
import 'package:flutter/material.dart';
import 'package:speakup/views/pages/universal_tile_page.dart';
import 'package:speakup/views/pages/user_created_page.dart';

class Tile {
  String emoji;
  String title;
  Widget route;

  Tile({required this.emoji, required this.title, required this.route});
}

List<Tile> tiles = [
  Tile(emoji: "❤", title: "Favourites", route: UserCreatedPage()),
  Tile(emoji: "🕰", title: "Recently Used", route: UserCreatedPage()),
  Tile(emoji: "✍", title: "User Created", route: UserCreatedPage()),
  Tile(
      emoji: "\u{1F522}",
      title: "Numbers",
      route: UniversalTilePage(routename: "Numbers")),
  Tile(
      emoji: "🔠",
      title: "Alphabets",
      route: UniversalTilePage(
        routename: "Alphabets",
      )),
  Tile(
      emoji: "🖐",
      title: "Common",
      route: UniversalTilePage(
        routename: "Common",
      )),
  Tile(emoji: "🤐", title: "Mute", route: UserCreatedPage()),
  Tile(
      emoji: "🕰",
      title: "Date & Time",
      route: UniversalTilePage(
        routename: "Date & Time",
      )),
  Tile(
      emoji: "🗣",
      title: "Explanation",
      route: UniversalTilePage(
        routename: "Explanation",
      )),
];
