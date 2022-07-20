import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supafire/ui/views/home_view.dart';
import 'package:supafire/ui/views/verify_email_page.dart';
import 'package:supafire/services/authentication_service.dart';

class VerifyEmailPageController extends State<VerifyEmailPage> {
  final AuthenticationService _authService = AuthenticationService();

  User? user;
  Timer? _timer;
  late bool emailVerified;

  @override
  void initState() {
    super.initState();

    user = _authService.currentUser;
    emailVerified = false;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        if (mounted) {
          await _authService.currentUser!.reload().then(
                (value) => setState(
                  () => emailVerified = user!.emailVerified,
                ),
              );
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _authService.authState,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (emailVerified) {
            return const HomePage();
          } else {
            return VerifyEmailView(viewController: this);
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
