import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Featuers/auth/domain/repos/auth_repo.dart';
import 'package:newsapp/Featuers/auth/presentation/phone_signin/phone_signin_state.dart';

class PhoneSigninCubit extends Cubit<PhoneSigninState> {
  final AuthRepo authRepo;

  PhoneSigninCubit(this.authRepo) : super(PhoneSigninInitial());

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    emit(PhoneSigninLoading());

    await authRepo.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSentCallback: (verificationId) {
        emit(
          PhoneSigninCodeSent(verificationId),
        );
      },
      verificationFailedCallback: (errorMessage) {
        emit(PhoneSigninError(errorMessage));
      },
    );
  }

  Future<void> signInWithOtp(String verificationId, String otp) async {
    emit(PhoneSigninLoading());

    final result = await authRepo.signInWithOtp(verificationId, otp);
    result.fold(
      (failure) {
        emit(PhoneSigninError(failure.message));
      },
      (user) {
        emit(PhoneSigninSuccess(user)); // Emit success with the User object
      },
    );
  }
}
