import 'package:flutter/material.dart';
import 'package:supafire/viewmodels/signup_view_model.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 36),
              ),
              TextFormField(controller: signUpController.displayNameController),
              TextFormField(controller: signUpController.emailController),
              TextFormField(controller: signUpController.passwordController),
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
