import 'dart:convert';

mixin Base64CoderMixin {
  String encodePassword({required String text}) {
    List<int> encodedText = utf8.encode(text);
    String base64Str = base64.encode(encodedText);

    return base64Str;
  }
}
