import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsapp/Core/errors/exceptions.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.sendEmailVerification();
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception inFirebaseAuthService.createUserWithEmailAndPassword :${e.toString()}',
      );
      if (e.code == 'weak-password') {
        throw CustomExceptions(
          message: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(
          message: 'The account already exists for that email.',
        );
      } else if (e.code == 'invalid-email') {
        throw CustomExceptions(
          message: 'The email address is badly formatted.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(
          message: 'No internet connection. Please try again later.',
        );
      } else {
        throw CustomExceptions(
          message: 'An error occurred. Please try again later.',
        );
      }
    } catch (e) {
      log(
        'Exception inFirebaseAuthService.createUserWithEmailAndPassword :${e.toString()}',
      );
      throw CustomExceptions(
        message: 'An error occurred. Please try again later.',
      );
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (!credential.user!.emailVerified) {
        await _firebaseAuth.signOut();
        throw CustomExceptions(
          message: 'Email not verified. Please check your inbox.',
        );
      }
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception inFirebaseAuthService.signInWithEmailAndPassword :${e.toString()}',
      );
      if (e.code == 'invalid-credential') {
        throw CustomExceptions(
          message: 'Wrong Email or Password',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(
          message: 'No internet connection. Please try again later.',
        );
      } else {
        throw CustomExceptions(
          message: 'An error occurred. Please try again later.',
        );
      }
    } catch (e) {
      log(
        'Exception inFirebaseAuthService.signInWithEmailAndPassword :${e.toString()}',
      );
      throw CustomExceptions(
        message: 'An error occurred. Please try again later.',
      );
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    try {
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception inFirebaseAuthService.signInWithEmailAndPassword :${e.toString()}',
      );
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomExceptions(
          message: 'The account already exists',
        );
      } else {
        throw CustomExceptions(
          message: 'An error occurred. Please try again later.',
        );
      }
    } catch (e) {
      log(
        'Exception inFirebaseAuthService.signInWithEmailAndPassword :${e.toString()}',
      );
      throw CustomExceptions(
        message: 'An error occurred. Please try again later.',
      );
    }
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    try {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      return (await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential))
          .user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception inFirebaseAuthService.signInWithEmailAndPassword :${e.toString()}',
      );
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomExceptions(
          message: 'The account already exists',
        );
      } else {
        throw CustomExceptions(
          message: 'An error occurred. Please try again later.',
        );
      }
    } catch (e) {
      log(
        'Exception inFirebaseAuthService.signInWithEmailAndPassword :${e.toString()}',
      );
      throw CustomExceptions(
        message: 'An error occurred. Please try again later.',
      );
    }
  }

  Future<void> sendPasswordResetLink({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.toString()}');
      if (e.code == 'invalid-email') {
        throw CustomExceptions(
            message: 'The email address is badly formatted.');
      } else {
        throw CustomExceptions(message: e.message ?? 'An error occurred.');
      }
    } catch (e) {
      log('Exception: ${e.toString()}');
      throw CustomExceptions(
          message: 'An error occurred. Please try again later.');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
  }

  // Future<bool> isUserLoggedIn() async {
  //   return _firebaseAuth.currentUser != null;
  // }

  // Future<bool> isEmailVerified() async {
  //   final user = _firebaseAuth.currentUser;
  //   if (user == null) {
  //     return false;
  //   }
  //   return user.emailVerified;
  // }

  // Future<void> sendEmailVerification() async {
  //   final user = _firebaseAuth.currentUser;
  //   if (user == null) {
  //     throw CustomExceptions(message: 'User not found');
  //   }
  //   await user.sendEmailVerification();
  // }

  // Future<void> deleteUser() async {
  //   final user = _firebaseAuth.currentUser;
  //   if (user == null) {
  //     throw CustomExceptions(message: 'User not found');
  //   }
  //   await user.delete();
  // }

  // Future<void> updateEmail({required String newEmail}) async {
  //   final user = _firebaseAuth.currentUser;
  //   if (user == null) {
  //     throw CustomExceptions(message: 'User not found');
  //   }
  //   await user.verifyBeforeUpdateEmail(newEmail);
  // }

  // Future<void> updatePassword({required String newPassword}) async {
  //   final user = _firebaseAuth.currentUser;
  //   if (user == null) {
  //     throw CustomExceptions(message: 'User not found');
  //   }
  //   await user.updatePassword(newPassword);
  // }

  // Future<void> reauthenticateWithCredential(
  //     {required AuthCredential credential}) async {
  //   final user = _firebaseAuth.currentUser;
  //   if (user == null) {
  //     throw CustomExceptions(message: 'User not found');
  //   }
  //   await user.reauthenticateWithCredential(credential);
  // }

  // Future<void> reload() async {
  //   final user = _firebaseAuth.currentUser;
  //   if (user == null) {
  //     throw CustomExceptions(message: 'User not found');
  //   }
  //   await user.reload();
  // }

  // Future<void> unlink({required String providerId}) async {
  //   final user = _firebaseAuth.currentUser;
  //   if (user == null) {
  //     throw CustomExceptions(message: 'User not found');
  //   }
  //   await user.unlink(providerId);
  // }
}
