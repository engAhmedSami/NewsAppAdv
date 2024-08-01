import 'package:flutter/material.dart';
import 'package:newsapp/Core/widget/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
    required this.controller,
  });
  final void Function(String?)? onSaved;
  final TextEditingController controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obobscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      obobscureText: obobscureText,
      onSaved: widget.onSaved,
      hintText: 'Password',
      textInputType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          obobscureText = !obobscureText;
          setState(() {});
        },
        child: obobscureText
            ? const Icon(
                Icons.visibility_off,
                color: Color(0XFFC9CECF),
              )
            : const Icon(
                Icons.remove_red_eye,
                color: Color(0XFFC9CECF),
              ),
      ),
    );
  }
}
