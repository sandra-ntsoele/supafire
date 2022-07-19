import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  /// Fields
  final FirebaseAuth _firebase = FirebaseAuth.instance;

  /// Properties
  Stream<User?> get authState => _firebase.authStateChanges();

  /// Methods
  Future signOut() async {
    await _firebase.signOut();

    return true;
  }

  Future<void> deleteUser() => _firebase.currentUser!.delete();

  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await _firebase.signInWithEmailAndPassword(
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
      UserCredential userCredentials = await _firebase
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (response) async {
          User? user = response.user;

          await Future.wait([
            user!.updateDisplayName(displayName),
            user.sendEmailVerification()
          ]);

          return response;
        },
      );

      return userCredentials.user;
    } on FirebaseAuthException catch (e) {
      return e;
    } catch (e) {
      return e;
    }
  }
}
