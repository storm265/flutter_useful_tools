import 'package:flutter_useful_tools/tools/profanity_detector/profanity_list.dart';

class ProfanityDetector {
  static bool hasProfanity({required String word}) {
    if (word.isNotEmpty) {
      for (var i = 0; i < profanityList.length; i++) {
        if (profanityList[i] == word.trim().toLowerCase()) {
          return true;
        }
      }
    }
    return false;
  }
}
