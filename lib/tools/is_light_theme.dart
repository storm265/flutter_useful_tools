import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool isLightTheme({required BuildContext context}) => Platform.isIOS
    ? CupertinoTheme.of(context).brightness == Brightness.light
    : Theme.of(context).brightness == Brightness.light;
