import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Featuers/auth/domain/entites/user_entity.dart';
import 'package:newsapp/Featuers/auth/domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signIn(String email, String password) async {
    emit(SigninLoading());

    final result = await authRepo.signInWithEmailAndPassword(
      email,
      password,
    );

    result.fold(
      (failuer) => emit(SigninFailure(message: failuer.message)),
      (success) => emit(SigninSuccess(userEntity: success)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failuer) => emit(SigninFailure(message: failuer.message)),
      (success) => emit(SigninSuccess(userEntity: success)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failuer) => emit(SigninFailure(message: failuer.message)),
      (success) => emit(SigninSuccess(userEntity: success)),
    );
  }

  Future<void> sendPasswordResetLink(String email) async {
    emit(SigninLoading());

    final result = await authRepo.sendPasswordResetLink(email);

    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (_) => emit(SigninSuccess(
          userEntity: UserEntity(name: '', email: email, uId: ''))),
    );
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    emit(SigninLoading());

    await authRepo.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSentCallback: (verificationId) {
        emit(
          SigninCodeSent(verificationId),
        );
      },
      verificationFailedCallback: (errorMessage) {
        emit(SigninFailure(
          message: errorMessage,
        ));
      },
    );
  }

  Future<void> signInWithOtp(String verificationId, String otp) async {
    emit(SigninLoading());

    final result = await authRepo.signInWithOtp(verificationId, otp);
    result.fold(
      (failure) {
        emit(SigninFailure(
          message: failure.message,
        ));
      },
      (user) {
        emit(SigninSuccess(
          userEntity: user,
        )); // Emit success with the User object
      },
    );
  }
}
