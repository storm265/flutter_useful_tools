import 'package:flutter_useful_tools/tools/profanity_detector/profanity_list.dart';

class ProfanityDetector {
  static bool hasProfanity({required String text}) {
    if (text.isNotEmpty) {
      final splittedText = text.trim().toLowerCase().split(' ');
      for (var w in splittedText) {
        if (profanityList
            .where((profanityWord) => profanityWord == w)
            .toList()
            .isNotEmpty) {
          return true;
        }
      }
    }
    return false;
  }
}
