import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_home/core/constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.sufficIconData,
    this.obscure = false,
    this.textObscureCallback,
    required this.labelText,
    required this.controller,
    this.inputType,
    this.inputFormatters,
  }) : super(key: key);

  final bool obscure;
  final IconData? sufficIconData;
  final String labelText;
  final TextEditingController controller;
  final void Function()? textObscureCallback;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType ?? TextInputType.text,
      obscureText: obscure && (labelText == 'Password'),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: labelText == 'Password'
            ? InkWell(
                onTap: textObscureCallback,
                child: Icon(obscure ? Icons.visibility : Icons.visibility_off),
              )
            : sufficIconData != null
                ? Icon(sufficIconData)
                : null,
        fillColor: Colors.transparent,
        border: const OutlineInputBorder(
          borderRadius: AppConstants.borderRadius12,
        ),
        labelText: labelText,
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppConstants.borderRadius12,
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
