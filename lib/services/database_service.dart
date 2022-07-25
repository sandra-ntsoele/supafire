import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supafire/services/authentication_service.dart';
import 'package:supafire/services/db_details.dart';

class DatabaseService {
  SupabaseClient supabase = Supabase.instance.client;
  final AuthenticationService _authService = AuthenticationService();

  Stream tableStream({required String table, required String uniqueColumns}) {
    Stream<List<Map<String, dynamic>>> subscription =
        supabase.from(table).stream([uniqueColumns]).execute();

    return subscription.map((event) => event);
  }

  setAccessToken() async {
    final firebaseToken = await _authService.idToken;
    Map payload = JwtDecoder.decode(firebaseToken);
    String accessToken = JWT(payload).sign(SecretKey(DBDetails.secret));

    supabase.auth.setAuth(accessToken);
  }
}
