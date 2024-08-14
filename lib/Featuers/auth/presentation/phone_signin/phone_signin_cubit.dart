import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Featuers/auth/domain/repos/auth_repo.dart';
import 'package:newsapp/Featuers/auth/presentation/phone_signin/phone_signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepo authRepo;

  SigninCubit(this.authRepo) : super(PhoneSigninInitial());

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
        emit(SigninFailure(errorMessage));
      },
    );
  }

  Future<void> signInWithOtp(String verificationId, String otp) async {
    emit(SigninLoading());

    final result = await authRepo.signInWithOtp(verificationId, otp);
    result.fold(
      (failure) {
        emit(SigninFailure(failure.message));
      },
      (user) {
        emit(PhoneSigninSuccess(user)); // Emit success with the User object
      },
    );
  }
}
