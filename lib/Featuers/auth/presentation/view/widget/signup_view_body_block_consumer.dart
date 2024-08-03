import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:newsapp/Core/helper_function/failuer_top_snak_bar.dart';
import 'package:newsapp/Core/helper_function/scccess_top_snak_bar.dart';
import 'package:newsapp/Featuers/auth/presentation/signup_cubit/signup_cubit.dart';
import 'package:newsapp/Featuers/auth/presentation/view/verfied_email_view.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/signup_view_body.dart';

class SignupViewBodyBlockConsumer extends StatelessWidget {
  const SignupViewBodyBlockConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          succesTopSnackBar(
            context,
            'Account created successfully, verify your account  ',
          );
        }
        Navigator.pushReplacementNamed(
          context,
          VerfiedEmailView.routeName,
        );
        if (state is SignupFailure) {
          failuerTopSnackBar(
            context,
            state.message,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoding ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
