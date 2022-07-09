import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return user.user != null;
    } catch (e) {
      return e;
    }
    return null;
  }

  Future signUpWIthEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return user.user != null;
    } catch (e) {
      return e;
    }
  }
}
