import 'package:flutter/material.dart';
import 'package:supafire/controllers/verify_email_page_controller.dart';
import 'package:supafire/ui/shared/layout_helpers.dart';
import 'package:supafire/ui/shared/shared_styles.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => VerifyEmailPageController();
}

class VerifyEmailView extends StatelessWidget {
  final VerifyEmailPageController viewController;
  const VerifyEmailView({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Check your email!",
                style: SharedStyles.headingOne,
              ),
              LayoutHelpers.largeVerticalSpace,
              Text(
                "We sent you a verification email.",
                style: SharedStyles.paragraphOne,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
