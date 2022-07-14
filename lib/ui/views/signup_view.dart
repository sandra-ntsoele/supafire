import 'package:flutter/material.dart';
import 'package:supafire/controllers/signup_controller.dart';
import 'package:supafire/ui/shared/layout_helpers.dart';
import 'package:supafire/ui/widgets/display_name_text_field.dart';
import 'package:supafire/ui/widgets/email_text_field.dart';
import 'package:supafire/ui/widgets/password_text_field.dart';

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
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              LayoutHelpers.smallVerticalSpace,
              DisplayNameTextField(
                controller: signUpController.displayNameController,
              ),
              LayoutHelpers.smallVerticalSpace,
              EmailTextField(
                controller: signUpController.emailController,
              ),
              LayoutHelpers.smallVerticalSpace,
              PasswordTextField(
                controller: signUpController.passwordController,
              ),
              LayoutHelpers.smallVerticalSpace,
              ElevatedButton(
                onPressed: () async {
                  signUpController.updateLoading();
                  signUpController.signUp();
                },
                child:
                    Text(signUpController.loading ? "Loading..." : "Sign Up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
