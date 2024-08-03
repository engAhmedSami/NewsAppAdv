import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/helper_function/failuer_top_snak_bar.dart';
import 'package:newsapp/Core/helper_function/scccess_top_snak_bar.dart';

import 'package:newsapp/Core/services/get_it_service.dart';
import 'package:newsapp/Core/widget/build_app.dart';
import 'package:newsapp/Core/widget/custom_progrss_hud.dart';
import 'package:newsapp/Featuers/auth/domain/repos/auth_repo.dart';
import 'package:newsapp/Featuers/auth/presentation/signin_cubit/signin_cubit.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const routName = 'ForgotPasswordView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'Forgot Password',
        ),
        body: const ForgotPasswordViewBodyBlocCunsumer(),
      ),
    );
  }
}

class ForgotPasswordViewBodyBlocCunsumer extends StatelessWidget {
  const ForgotPasswordViewBodyBlocCunsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          succesTopSnackBar(
              context, 'Password reset link sent to ${state.userEntity.email}');
        } else if (state is SigninFailure) {
          failuerTopSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgrssHud(
            isLoading: state is SigninLoading,
            child: const ForgotPasswordViewBody());
      },
    );
  }
}
