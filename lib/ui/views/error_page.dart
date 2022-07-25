import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:supafire/controllers/home_page_controller.dart';
import 'package:supafire/ui/shared/layout_helpers.dart';
import 'package:supafire/ui/shared/shared_styles.dart';

class ErrorPage extends StatelessWidget {
  final HomePageController viewController;
  final dynamic error;

  const ErrorPage({
    Key? key,
    required this.viewController,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Something went wrong.",
          style: SharedStyles.headingOne,
        ),
        LayoutHelpers.smallVerticalSpace,
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: SharedStyles.paragraphTwo,
            text: "${error.message}.\n\n",
            children: [
              const TextSpan(text: "Please restart the app or "),
              TextSpan(
                  text: "Contact support",
                  style: SharedStyles.hyperlink,
                  recognizer: TapGestureRecognizer()..onTap = () => InkWell()),
            ],
          ),
        ),
      ],
    );
  }
}
