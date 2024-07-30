import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:newsapp/Featuers/auth/presentation/signup_cubit/signup_cubit.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/signup_view_body.dart';

class SigneupViewBodyBlockConsumer extends StatelessWidget {
  const SigneupViewBodyBlockConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {}
        if (state is SignupFailure) {
          final snackBar = SnackBar(
            content: AwesomeSnackbarContent(
              title: 'Error',
              message: state.message, // Assume `SignupError` has `errorMessage`
              contentType: ContentType.failure,
            ),
            elevation: 0,
            backgroundColor: Colors
                .transparent, // Makes the background transparent for `AwesomeSnackbarContent`
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
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
