import 'package:newsapp/Featuers/auth/domain/entites/user_entity.dart';

abstract class SigninState {}

class PhoneSigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninCodeSent extends SigninState {
  final String verificationId;

  SigninCodeSent(this.verificationId);
}

class PhoneSigninSuccess extends SigninState {
  final UserEntity user;

  PhoneSigninSuccess(this.user);
}

class SigninFailure extends SigninState {
  final String message;

  SigninFailure(this.message);
}
