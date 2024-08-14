import 'package:dartz/dartz.dart';
import 'package:newsapp/Core/errors/failures.dart';
import 'package:newsapp/Featuers/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either<Failures, UserEntity>> signInWithGoogle();

  Future<Either<Failures, UserEntity>> signInWithFacebook();
  Future<Either<Failures, void>> sendPasswordResetLink(String email);
  Future<Either<Failures, void>> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId) codeSentCallback,
    required Function(String errorMessage) verificationFailedCallback,
  });
  Future<Either<Failures, UserEntity>> signInWithOtp(
      String verificationId, String otp);
  // Other methods remain the same
}
