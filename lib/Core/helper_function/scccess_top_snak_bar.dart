import 'package:flutter/material.dart';
import 'package:newsapp/Core/utils/app_styles.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void succesTopSnackBar(BuildContext context, String message) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: message,
      textStyle: AppStyles.styleSemiBold16.copyWith(color: Colors.white),
    ),
  );
}
