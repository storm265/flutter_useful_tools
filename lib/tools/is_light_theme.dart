import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension IsLightTheme on BuildContext {
  bool isLightTheme() => Platform.isIOS
      ? CupertinoTheme.of(this).brightness == Brightness.light
      : Theme.of(this).brightness == Brightness.light;
}
