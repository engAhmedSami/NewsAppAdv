import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/helper_function/failuer_top_snak_bar.dart';
import 'package:newsapp/Core/helper_function/scccess_top_snak_bar.dart';
import 'package:newsapp/Core/services/auth_handeler.dart';
import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
import 'package:newsapp/Core/widget/custom_progrss_hud.dart';
import 'package:newsapp/Featuers/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserPrefs userPrefs = UserPrefs();

    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          succesTopSnackBar(
            context,
            'Signin Successfully',
          );

          Navigator.pushReplacementNamed(context, AuthHandler.routeName);

          userPrefs.setLoggedIn(true);
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
