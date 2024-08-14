import 'package:newsapp/Featuers/auth/domain/entites/user_entity.dart';

abstract class PhoneSigninState {}

class PhoneSigninInitial extends PhoneSigninState {}

class PhoneSigninLoading extends PhoneSigninState {}

class PhoneSigninCodeSent extends PhoneSigninState {
  final String verificationId;

  PhoneSigninCodeSent(this.verificationId);
}

class PhoneSigninSuccess extends PhoneSigninState {
  final UserEntity user;

  PhoneSigninSuccess(this.user);
}

class PhoneSigninError extends PhoneSigninState {
  final String message;

  PhoneSigninError(this.message);
}
