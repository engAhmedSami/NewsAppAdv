import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:newsapp/Core/errors/exceptions.dart';
import 'package:newsapp/Core/errors/failures.dart';
import 'package:newsapp/Core/services/firebase_auth_service.dart';
import 'package:newsapp/Featuers/auth/data/models/user_model.dart';
import 'package:newsapp/Featuers/auth/domain/entites/user_entity.dart';
import 'package:newsapp/Featuers/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword :${e.toString()}',
      );
      return left(
        ServerFailure(
          'An error occurred. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword :${e.toString()}',
      );
      return left(
        ServerFailure(
          'An error occurred. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithGoogle :${e.toString()}',
      );
      return left(
        ServerFailure(
          'An error occurred. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithFacebook :${e.toString()}',
      );
      return left(
        ServerFailure(
          'An error occurred. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, void>> sendPasswordResetLink(String email) async {
    try {
      await firebaseAuthService.sendPasswordResetLink(email: email);
      return right(null);
    } on CustomExceptions catch (e) {
      log('FirebaseAuthException in AuthRepoImpl.sendPasswordResetLink :${e.toString()}');

      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.sendPasswordResetLink :${e.toString()}');
      return left(ServerFailure('An error occurred. Please try again later.'));
    }
  }
}
