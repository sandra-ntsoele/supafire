import 'package:flutter/material.dart';
import 'package:supafire/constants/route_names.dart';
import 'package:supafire/services/authentication_service.dart';
import 'package:supafire/ui/views/signup_view.dart';
import 'package:supafire/ui/widgets/custom_alert_dialog.dart';
import 'package:supafire/services/navigator_service.dart';

class SignUpController extends State<SignUp> {
  final AuthenticationService _authService = AuthenticationService();
  final NavigatorService _navService = NavigatorService();

  final displayNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  @override
  void dispose() {
    displayNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  updateLoading() {
    setState(() {
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) => SignUpView(signUpController: this);

  Future signUp() async {
    String displayName = displayNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    var result = await _authService.signUpWIthEmail(
      displayName: displayName,
      email: email,
      password: password,
    );

    if (result is bool) {
      if (result) {
        _navService.navigateTo(HomeViewRoute);
      } else {
        const CustomAlertDialog(
          title: "Supafire",
          message: "Something went wrong..",
        );
      }
    }
  }

  Future login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    var result = await _authService.loginWithEmail(
      email: email,
      password: password,
    );

    if (result is bool) {
      if (result) {
        // TODO: Navigate to home
      } else {
        // TODO: Show dialog with error message
      }
    }
  }
}
