import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:postgrest/postgrest.dart';
import 'package:supafire/constants/route_names.dart';
import 'package:supafire/models/user_model.dart';
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
  final DatabaseService _dbService = DatabaseService();

  Stream? tableStream;
  UserModel? userModel;
  dynamic userRecord;

  int currentIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    pages.addAll([
      const BookCollectionPage(),
      ProfilePage(viewController: this),
    ]);

    tableStream = _dbService.tableStream(
      table: "wishlist",
      uniqueColumns: "book_id, user_id, created, book_is_read",
    );

    String? displayName = _authService.currentUser!.displayName;
    String? email = _authService.currentUser!.email;
    String? uid = _authService.currentUser!.uid;

    userModel = UserModel(
      displayName: displayName.toString(),
      email: email.toString(),
      uid: uid,
    );

    userRecord = userModel!.getUserRecord();

    super.initState();
  }

  /// Class methods
  Widget _syncUserFutureBuilder() {
    return FutureBuilder(
      future: userModel!.syncUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data is PostgrestError) {
            return ErrorPage(viewController: this, error: snapshot.data);
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

  Widget selectedPage() {
    return FutureBuilder(
      future: userRecord,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          // Whilst busy executing future
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // Once future has executed and response retrieved
          if (snapshot.data is PostgrestError) {
            return ErrorPage(viewController: this, error: snapshot.data);
          } else if (snapshot.data is bool) {
            return _syncUserFutureBuilder();
          } else {
            return pages[currentIndex];
          }
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
