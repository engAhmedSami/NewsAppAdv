import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/helper_function/failuer_top_snak_bar.dart';
import 'package:newsapp/Core/helper_function/scccess_top_snak_bar.dart';
import 'package:newsapp/Core/widget/custom_progrss_hud.dart';
import 'package:newsapp/Featuers/auth/presentation/signin_cubit/signin_cubit.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/login_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          succesTopSnackBar(
            context,
            'Signin Successfully',
          );
        }
        if (state is SigninFailure) {
          failuerTopSnackBar(
            context,
            state.message,
          );
        }
      },
      builder: (context, state) {
        return CustomProgrssHud(
          isLoading: state is SigninLoading,
          child: const SigninViewBody(),
        );
      },
    );
  }
}
