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
  }

  Future<dynamic> signUpWIthEmail({
    required String displayName,
    required String email,
    required String password,
  }) async {
    try {
      var user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      return e;
    } catch (e) {
      return e;
    }
  }
}
