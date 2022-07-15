import 'package:flutter/material.dart';
import 'package:supafire/controllers/signup_controller.dart';
import 'package:supafire/ui/shared/app_colors.dart';

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
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          backgroundColor: MaterialStateProperty.all(AppColours.black),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              letterSpacing: 3,
            ),
          ),
        ),
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
