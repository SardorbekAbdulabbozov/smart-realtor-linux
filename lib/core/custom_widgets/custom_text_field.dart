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
    this.hintText, this.enabled,
  }) : super(key: key);

  final bool? enabled;
  final bool obscure;
  final IconData? sufficIconData;
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final void Function()? textObscureCallback;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
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
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppConstants.borderRadius12,
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: AppConstants.borderRadius12,
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
