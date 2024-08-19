import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/helper_function/failuer_top_snak_bar.dart';
import 'package:newsapp/Core/helper_function/scccess_top_snak_bar.dart';
import 'package:newsapp/Core/services/get_it_service.dart';
import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
import 'package:newsapp/Core/widget/custom_progrss_hud.dart';
import 'package:newsapp/Featuers/auth/domain/repos/auth_repo.dart';
import 'package:newsapp/Featuers/auth/presentation/manager/signin_cubit/signin_cubit.dart';

import 'package:newsapp/Featuers/auth/presentation/view/verfied_email_view.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/otp_phone_view_body.dart';
import 'package:newsapp/Core/services/auth_handeler.dart';

class OtpPhoneView extends StatelessWidget {
  const OtpPhoneView({
    super.key,
    required this.verificationId,
  });
  static const routeName = 'OtpPhoneView';
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    UserPrefs userPrefs = UserPrefs();

    return BlocProvider(
      create: (context) => SigninCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBarC(
          title: 'OTP Verification',
          context,
        ),
        body: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninSuccess) {
              Navigator.of(context).pushReplacementNamed(AuthHandler.routeName);
              succesTopSnackBar(
                context,
                'Phone Verified',
              );
              userPrefs.setLoggedIn(true);
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
              child: OtpPhoneViewBody(
                verificationId: verificationId,
              ),
            );
          },
        ),
      ),
    );
  }
}
