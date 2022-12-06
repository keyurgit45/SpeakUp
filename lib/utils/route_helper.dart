import 'package:speakup/models/alphabet_tiles.dart';
import 'package:speakup/models/common_tiles.dart';
import 'package:speakup/models/date_time_tiles.dart';
import 'package:speakup/models/explanation_tiles.dart';
import 'package:speakup/models/number_tiles.dart';
import 'package:speakup/models/universal_tile_model.dart';

List<UniversalTile> getTileName(String routeName) {
  if (routeName == "Common") {
    return commonTiles;
  } else if (routeName == "Alphabets") {
    return alphabetTiles;
  } else if (routeName == "Numbers") {
    return numberTiles;
  } else if (routeName == "Date & Time") {
    return dateTimeTiles;
  } else if (routeName == "Explanation") {
    return explanationTiles;
  } else {
    return commonTiles;
  }
}

bool isAlphabetTile(String routeName) {
  if (routeName == "A") {
    return true;
  } else {
    return false;
  }
}

bool isExplanationTile(String routeName) {
  if (routeName.startsWith("SpeakUp")) {
    return true;
  } else {
    return false;
  }
}
