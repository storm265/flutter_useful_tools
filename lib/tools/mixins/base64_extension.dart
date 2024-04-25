import 'dart:convert';

extension Base64Extension on String {
  String encodePassword() => base64.encode(utf8.encode(this));
}
