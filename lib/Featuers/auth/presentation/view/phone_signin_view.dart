import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/helper_function/failuer_top_snak_bar.dart';
import 'package:newsapp/Core/helper_function/scccess_top_snak_bar.dart';
import 'package:newsapp/Core/services/get_it_service.dart';
import 'package:newsapp/Core/widget/build_app.dart';
import 'package:newsapp/Core/widget/custom_progrss_hud.dart';
import 'package:newsapp/Featuers/auth/domain/repos/auth_repo.dart';
import 'package:newsapp/Featuers/auth/presentation/manager/signin_cubit/signin_cubit.dart';

import 'package:newsapp/Featuers/auth/presentation/view/otp_phone_view.dart';
import 'widget/phone_signin_view_body.dart';

class PhoneSigninView extends StatelessWidget {
  const PhoneSigninView({super.key});
  static const routeName = 'Signinphone';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'Phone Signin',
        ),
        body: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninCodeSent) {
              succesTopSnackBar(
                context,
                'Code Sent',
              );
              Navigator.pushNamed(context, OtpPhoneView.routeName,
                  arguments: state.verificationId);
            } else if (state is SigninFailure) {
              failuerTopSnackBar(
                context,
                state.message,
              );
            }
          },
          builder: (context, state) {
            return CustomProgrssHud(
                isLoading: state is SigninLoading,
                child: const PhoneSigninViewBody());
          },
        ),
      ),
    );
  }
}
