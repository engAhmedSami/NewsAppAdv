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
}
