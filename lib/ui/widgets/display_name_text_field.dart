import 'package:flutter/material.dart';
import 'package:supafire/ui/shared/app_colors.dart';
import 'package:supafire/ui/shared/shared_styles.dart';

class DisplayNameTextField extends StatelessWidget {
  final TextEditingController controller;
  const DisplayNameTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: SharedStyles.textFieldDecoration(
        label: "Display Name",
        suffixIcon: Icons.person_pin_rounded,
      ),
      style: SharedStyles.textFieldStyle,
      cursorColor: AppColours.grey,
      textCapitalization: TextCapitalization.words, // unique
    );
  }
}
