import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supafire/constants/route_names.dart';
import 'package:supafire/services/authentication_service.dart';
import 'package:supafire/services/navigation_service.dart';
import 'package:supafire/ui/views/home_view.dart';
import 'package:supafire/ui/views/profile_page.dart';
import 'package:supafire/ui/views/signup_view.dart';
import 'package:supafire/ui/views/verify_email_page.dart';
import 'package:supafire/ui/views/book_collection_page.dart';

class HomePageController extends State<HomePage> {
  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: AuthenticationService().authState.map((user) => user),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User? user = snapshot.data as User;
            if (user.emailVerified) {
              return HomePageView(viewController: this);
            } else {
              return const VerifyEmailPage();
            }
          } else {
            return const SignUp();
          }
        },
      );

  @override
  void initState() {
    pages.addAll([
      const BookCollectionPage(),
      const ProfilePage(),
    ]);

    super.initState();
  }

  /// Class fields
  final AuthenticationService _authService = AuthenticationService();
  final NavigationService _navService = NavigationService();
  int currentIndex = 0;
  List<Widget> pages = [];

  /// Class methods
  void signOut() async {
    await _authService.signOut().then(
          (value) => _navService.navigateTo(
            context,
            routeName: SignUpPageRoute,
          ),
        );
  }

  void toggleCurrentIndex(int sourceIndex) {
    setState(() {
      currentIndex = sourceIndex;
    });
  }

  Widget selectedPage() {
    return pages[currentIndex];
  }
}
