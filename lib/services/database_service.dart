import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supafire/services/authentication_service.dart';
import 'package:supafire/services/db_details.dart';

class DatabaseService {
  SupabaseClient supabase = Supabase.instance.client;
  final AuthenticationService _authService = AuthenticationService();

  _setAccessToken() async {
    final firebaseToken = await _authService.idToken;
    Map payload = JwtDecoder.decode(firebaseToken);
    JWT(payload).sign(SecretKey(DBDetails.secret));
  }

  Future syncUser({
    String? displayName,
    String? email,
    String? uid,
  }) async {
    await _setAccessToken();
    PostgrestResponse response = await supabase.from("users").insert({
      "display_name": displayName,
      "email": email,
      "user_id": uid,
    }, returning: ReturningOption.minimal).execute();

    if (response.hasError) {
      log(response.error.toString());
      // code
      return response.error;
    } else {
      return response;
    }
  }
}
