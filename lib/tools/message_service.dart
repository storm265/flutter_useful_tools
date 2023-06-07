import 'package:flutter/material.dart';

class MessageService {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      displaySnackbar({
    required BuildContext context,
    required String message,
    int milliseconds = 2000,
  }) {
    FocusScope.of(context).unfocus();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(4.0),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.black.withOpacity(0.8),
          ),
          child: Text(
            message,
            maxLines: null,
          ),
        ),
        duration: Duration(milliseconds: milliseconds),
      ),
    );
  }
}
