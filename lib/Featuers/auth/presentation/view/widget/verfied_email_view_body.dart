// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Core/helper_function/failuer_top_snak_bar.dart';
import 'package:newsapp/Core/helper_function/scccess_top_snak_bar.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:newsapp/Core/widget/custom_botton.dart';

class VerfiedEmailViewBody extends StatelessWidget {
  const VerfiedEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please verify your email address.',
              style: AppStyles.styleSemiBold20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomBotton(
                onPressed: () => resendVerificationEmail(context),
                text: 'Resend Verification Email'),
            // ElevatedButton(
            //   onPressed: () => resendVerificationEmail(context),
            //   child: const Text('Resend Verification Email'),
            // ),
          ],
        ),
      ),
    );
  }
}

Future<void> resendVerificationEmail(BuildContext context) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null && !user.emailVerified) {
    await user.sendEmailVerification();
    succesTopSnackBar(context, 'Email verification link has been sent.');
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text('Email verification link has been sent.'),
    //   ),
    // );
  } else {
    failuerTopSnackBar(context, 'Unable to send verification email.');
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text('Unable to send verification email.'),
    //   ),
    // );
  }
}
