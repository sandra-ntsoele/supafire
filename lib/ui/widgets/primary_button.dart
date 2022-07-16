import 'package:flutter/material.dart';
import 'package:supafire/controllers/signup_controller.dart';
import 'package:supafire/ui/shared/app_colors.dart';
import 'package:supafire/ui/shared/shared_styles.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final ControllerState controllerState;

  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.controllerState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: SharedStyles.primaryButtonStyle(),
        onPressed: () {
          if (controllerState == ControllerState.listening) onPressed();
        },
        child: controllerState == ControllerState.listening
            ? const Text("Create Account")
            : const Text("Loading..."),
      ),
    );
  }
}
