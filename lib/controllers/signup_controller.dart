import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supafire/constants/route_names.dart';
import 'package:supafire/services/authentication_service.dart';
import 'package:supafire/services/dialog_service.dart';
import 'package:supafire/services/navigation_service.dart';
import 'package:supafire/ui/views/signup_view.dart';

enum ControllerState { busy, listening }

class SignUpController extends State<SignUp> {
  @override
  // Create view and share state with view
  Widget build(BuildContext context) => SignUpView(signUpController: this);

  /// Class fields
  final AuthenticationService _authService = AuthenticationService();
  final NavigationService _navigationService = NavigationService();

  final displayNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  ControllerState state = ControllerState.listening;

  /// Class methods
  @override
  void dispose() {
    displayNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void updateState() {
    setState(() {
      state == ControllerState.listening
          ? state = ControllerState.busy
          : state = ControllerState.listening;
    });
  }

  void signUp() async {
    String displayName = displayNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    await _authService
        .signUpWIthEmail(
      displayName: displayName.isEmpty ? "Sandra" : displayName,
      email: email.isEmpty ? "sandra.ntsoele@pm.me" : email,
      password: password.isEmpty ? "secure@thingy22" : password,
    )
        .then(
      (response) {
        if (mounted) {
          if (response is FirebaseAuthException) {
            DialogService.alert(
              context: context,
              title: "Account not created",
              message: response.message.toString(),
            );
            updateState();
          } else if (response is User) {
            _navigationService.navigateTo(
              context,
              routeName: VerifyEmailPageRoute,
            );
            updateState();
          }
        }
      },
    );
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
