import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supafire/services/database_service.dart';

class UserModel extends DatabaseService {
  String displayName;
  String email;
  String uid;

  UserModel({
    required this.displayName,
    required this.email,
    required this.uid,
  });

  Future getUserRecord() async {
    PostgrestResponse response = await supabase
        .from("users")
        .select()
        .eq(
          "user_id",
          uid,
        )
        .execute();

    if (response.hasError) {
      return response.error;
    } else {
      List userRecord = response.data as List;

      if (userRecord.isEmpty) {
        return false;
      } else {
        return userRecord;
      }
    }
  }

  Future syncUser() async {
    PostgrestResponse syncResponse = await supabase.from("users").insert({
      "display_name": displayName,
      "email": email,
      "user_id": uid,
    }, returning: ReturningOption.minimal).execute();

    if (syncResponse.hasError) {
      log(syncResponse.error.toString());
      return syncResponse.error;
    } else {
      return syncResponse;
    }
  }
}
