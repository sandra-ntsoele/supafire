import 'package:firebase_auth/firebase_auth.dart';

/// Responsible for communicating with Firebase Authentication.
class AuthenticationService {
  /// Fields
  final FirebaseAuth _firebase = FirebaseAuth.instance;

  /// Properties
  Stream<User?> get authState => _firebase.userChanges();
  User? get currentUser => _firebase.currentUser;
  Future<String> get idToken async {
    return await currentUser!.getIdToken(true);
  }

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
