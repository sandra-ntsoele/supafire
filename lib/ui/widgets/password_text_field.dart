import 'package:flutter/material.dart';
import 'package:supafire/ui/shared/app_colors.dart';
import 'package:supafire/ui/shared/shared_styles.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  const PasswordTextField({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => PasswordTextFieldController();
}

class PasswordTextFieldController extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) =>
      PasswordTextFieldView(viewController: this);

  bool passwordVisibility = false;

  void togglePasswordVisibility() {
    setState(() {
      passwordVisibility
          ? passwordVisibility = false
          : passwordVisibility = true;
    });
  }
}

class PasswordTextFieldView extends StatelessWidget {
  final PasswordTextFieldController viewController;

  const PasswordTextFieldView({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: viewController.widget.textEditingController,
      decoration: SharedStyles.textFieldDecoration(
        label: "Password",
        suffixIcon: IconButton(
          onPressed: () => viewController.togglePasswordVisibility(),
          icon: Icon(
            viewController.passwordVisibility
                ? Icons.visibility_rounded
                : Icons.visibility_off,
            color: AppColours.grey,
          ),
        ),
      ),
      style: SharedStyles.textFieldStyle,
      cursorColor: AppColours.grey,
      obscureText: viewController.passwordVisibility ? false : true,
    );
  }
}
