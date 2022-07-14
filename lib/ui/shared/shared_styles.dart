import 'package:flutter/material.dart';
import 'package:supafire/ui/shared/app_colors.dart';

class SharedStyles {
  static InputDecoration textFieldDecoration({
    required String label,
    required dynamic suffixIcon,
  }) {
    return InputDecoration(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      label: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
          color: AppColours.grey,
        ),
      ),
      suffixIcon: suffixIcon.runtimeType == IconData
          ? Icon(
              suffixIcon,
              color: AppColours.grey,
            )
          : suffixIcon,
      contentPadding: const EdgeInsets.all(20),
    );
  }

  static TextStyle textFieldStyle = TextStyle(
    fontSize: 14,
    letterSpacing: 0.3,
    color: AppColours.grey,
  );
}
