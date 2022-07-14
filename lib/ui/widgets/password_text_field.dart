import 'package:flutter/material.dart';
import 'package:supafire/ui/shared/app_colors.dart';
import 'package:supafire/ui/shared/shared_styles.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  const PasswordTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: SharedStyles.textFieldDecoration(
        label: "Password",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.visibility_off,
            color: AppColours.grey,
          ),
        ),
      ),
      style: SharedStyles.textFieldStyle,
      cursorColor: AppColours.grey,
      obscureText: true,
    );
  }
}
