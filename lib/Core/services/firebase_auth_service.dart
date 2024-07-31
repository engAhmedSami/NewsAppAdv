import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsapp/Core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

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
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception inFirebaseAuthService.signInWithEmailAndPassword :${e.toString()}',
      );
      if (e.code == 'invalid-credential') {
        throw CustomExceptions(
          message: 'Wrong Email or Password',
        );
      } else if (e.code == 'invalid-credential') {
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

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }
}
