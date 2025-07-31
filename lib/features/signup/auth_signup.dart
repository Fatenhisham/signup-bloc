import 'package:firebase_auth/firebase_auth.dart';

class AuthSignUpService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(_getMessageFromErrorCode(e.code));
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

  String _getMessageFromErrorCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'invalid-email':
        return 'This email address is invalid.';
      case 'weak-password':
        return 'Password is too weak.';
      default:
        return 'An unexpected error occurred.';
    }
  }
}
