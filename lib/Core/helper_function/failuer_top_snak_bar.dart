import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void failuerTopSnackBar(BuildContext context, String message) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
    ),
  );
}




  // buttom snakbar
  // final snackBar = SnackBar(
          //   content: AwesomeSnackbarContent(
          //     title: 'Error',
          //     message: state.message,
          //     contentType: ContentType.failure,
          //   ),
          //   elevation: 0,
          //   backgroundColor: Colors.transparent,
          //   behavior: SnackBarBehavior.floating,
          //   duration: const Duration(seconds: 3),
          // );

          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(snackBar);