import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsapp/Core/errors/exceptions.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
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
        await firebaseAuth.signOut();
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
      await firebaseAuth.sendPasswordResetEmail(email: email);
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
    await firebaseAuth.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
  }

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId) codeSentCallback,
    required Function(String errorMessage) verificationFailedCallback,
  }) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        verificationFailedCallback(e.message ?? 'Verification failed');
      },
      codeSent: (String verificationId, int? resendToken) {
        codeSentCallback(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<User> signInWithOtp(String verificationId, String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    final userCredential = await firebaseAuth.signInWithCredential(credential);
    return userCredential.user!;
  }

  Future<bool> checkExitingUser() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }
}
