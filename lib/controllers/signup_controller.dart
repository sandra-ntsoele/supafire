import 'package:flutter/material.dart';
import 'package:supafire/constants/route_names.dart';
import 'package:supafire/services/authentication_service.dart';
import 'package:supafire/ui/views/signup_view.dart';
import 'package:supafire/ui/widgets/custom_alert_dialog.dart';
import 'package:supafire/services/navigator_service.dart';

enum ControllerState { busy, listening }

class SignUpController extends State<SignUp> {
  final AuthenticationService _authService = AuthenticationService();
  final NavigatorService _navService = NavigatorService();

  final displayNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ControllerState state = ControllerState.listening;

  @override
  void dispose() {
    displayNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  updateState() async {
    setState(() {
      state == ControllerState.listening
          ? state = ControllerState.busy
          : state = ControllerState.listening;
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
        updateState();
        _navService.navigateTo(HomeViewRoute);
      } else {
        updateState();
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
