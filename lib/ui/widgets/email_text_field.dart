import 'package:flutter/material.dart';
import 'package:supafire/ui/shared/app_colors.dart';
import 'package:supafire/ui/shared/shared_styles.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: SharedStyles.textFieldDecoration(
        label: "Email Address",
        suffixIcon: Icons.mail_rounded,
      ),
      style: SharedStyles.textFieldStyle,
      cursorColor: AppColours.grey,
    );
  }
}
