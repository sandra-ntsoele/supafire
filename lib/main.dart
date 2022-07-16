import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supafire/constants/route_names.dart';
import 'package:supafire/services/authentication_service.dart';
import 'package:supafire/ui/views/home_view.dart';
import 'package:supafire/ui/views/signup_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SupaFire',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.rubik().fontFamily,
        textTheme: GoogleFonts.rubikTextTheme(),
      ),
      home: StreamBuilder(
        stream: AuthenticationService().authState,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeView();
          } else {
            return const SignUp();
          }
        },
      ),
      routes: {
        HomeViewRoute: (context) => const HomeView(),
      },
    );
  }
}
