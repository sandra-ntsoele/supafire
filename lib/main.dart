import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supafire/constants/route_names.dart';
import 'package:supafire/services/db_details.dart';
import 'package:supafire/ui/views/home_view.dart';
import 'package:supafire/ui/views/signup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supafire/ui/views/verify_email_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(
    () async => await Supabase.initialize(
      url: DBDetails.url,
      anonKey: DBDetails.anonKey,
    ),
  );
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
      home: const HomePage(),
      routes: {
        HomePageRoute: (context) => const HomePage(),
        SignUpPageRoute: (context) => const SignUp(),
        VerifyEmailPageRoute: (context) => const VerifyEmailPage(),
      },
    );
  }
}
