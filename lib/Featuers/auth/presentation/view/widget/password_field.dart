import 'package:flutter/material.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obobscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obobscureText: obobscureText,
      onSaved: widget.onSaved,
      hintText: 'Password',
      textInputType: TextInputType.visiblePassword,
      suffixIcon: const Icon(
        Icons.remove_red_eye,
        color: Color(0xff949d9e),
      ),
    );
  }
}
