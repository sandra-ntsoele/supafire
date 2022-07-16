import 'package:flutter/material.dart';
import 'package:supafire/ui/shared/app_colors.dart';
import 'package:supafire/ui/shared/layout_helpers.dart';
import 'package:supafire/ui/shared/shared_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? buttonTitle;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.message,
    this.buttonTitle = "Dismiss",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      content: Text(
        message,
        style: TextStyle(color: AppColours.grey, fontSize: 13),
      ),
      actions: [
        Column(
          children: [
            Divider(
              height: 2,
              color: AppColours.grey,
            ),
            LayoutHelpers.smallVerticalSpace,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: SharedStyles.primaryButtonStyle(
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  "Dismiss",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
