import 'package:flutter/material.dart';
import 'package:supafire/ui/widgets/custom_alert_dialog.dart';

class DialogService {
  static alert({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonTitle,
  }) {
    return showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: title,
        message: message,
        buttonTitle: buttonTitle,
      ),
    );
  }
}
