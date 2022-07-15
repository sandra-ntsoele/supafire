import 'package:flutter/material.dart';
import 'package:supafire/controllers/signup_controller.dart';
import 'package:supafire/ui/shared/layout_helpers.dart';
import 'package:supafire/ui/widgets/display_name_text_field.dart';
import 'package:supafire/ui/widgets/email_text_field.dart';
import 'package:supafire/ui/widgets/password_text_field.dart';
import 'package:supafire/ui/widgets/primary_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => SignUpController();
}

class SignUpView extends StatelessWidget {
  final SignUpController signUpController;

  const SignUpView({
    Key? key,
    required this.signUpController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            LayoutHelpers.largeVerticalSpace,
            DisplayNameTextField(
              controller: signUpController.displayNameController,
            ),
            LayoutHelpers.smallVerticalSpace,
            EmailTextField(
              controller: signUpController.emailController,
            ),
            LayoutHelpers.smallVerticalSpace,
            PasswordTextField(
              textEditingController: signUpController.passwordController,
            ),
            LayoutHelpers.largeVerticalSpace,
            PrimaryButton(
              controllerState: signUpController.state,
              onPressed: () async {
                signUpController.signUp();
                signUpController.updateState();
              },
            )
          ],
        ),
      ),
    );
  }
}
