import 'package:flutter/material.dart';
import 'package:newsapp/Featuers/auth/presentation/view/verfied_email_view.dart';
import 'package:newsapp/Featuers/auth/presentation/view/widget/otp_phone_view_body.dart';

class OtpPhoneView extends StatelessWidget {
  const OtpPhoneView({
    super.key,
    required this.verificationId,
  });
  static const routeName = 'OtpPhoneView';
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarC(
        title: 'OTP Verification',
        context,
      ),
      body: OtpPhoneViewBody(
        verificationId: verificationId,
      ),
    );
  }
}
