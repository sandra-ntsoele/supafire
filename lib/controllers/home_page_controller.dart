import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supafire/constants/route_names.dart';
import 'package:supafire/services/authentication_service.dart';
import 'package:supafire/services/database_service.dart';
import 'package:supafire/services/navigation_service.dart';
import 'package:supafire/ui/views/error_page.dart';
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

  /// Class fields
  final AuthenticationService _authService = AuthenticationService();
  final NavigationService _navService = NavigationService();

  Future? syncUser;
  int currentIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    pages.addAll([
      const BookCollectionPage(),
      ProfilePage(viewController: this),
    ]);

    syncUser = DatabaseService().syncUser(
      displayName: _authService.currentUser!.displayName,
      email: _authService.currentUser!.email,
      uid: _authService.currentUser!.uid,
    );

    super.initState();
  }

  /// Class methods
  Widget selectedPage() {
    return StreamBuilder(
      stream: DatabaseService().tableStream(
        table: "wishlist",
        uniqueColumns: "book_id, user_id, created, book_is_read",
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasError) {
            return ErrorPage(viewController: this);
          } else {
            return pages[currentIndex];
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

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

  reloadPage() => setState(() {});
}
