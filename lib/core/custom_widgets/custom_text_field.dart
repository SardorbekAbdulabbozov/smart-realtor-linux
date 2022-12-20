import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_home/core/constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.suffixIconData,
    this.obscure = false,
    this.textObscureCallback,
    this.labelText,
    required this.controller,
    this.inputType,
    this.inputFormatters,
    this.hintText,
    this.enabled,
    this.onChanged,
  }) : super(key: key);

  final bool? enabled;
  final bool obscure;
  final IconData? suffixIconData;
  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final void Function()? textObscureCallback;
  final void Function(String)? onChanged;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: inputType ?? TextInputType.text,
      obscureText: obscure && (labelText == 'Password'),
      onChanged: onChanged != null
          ? (value) {
              onChanged?.call(value);
            }
          : null,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: labelText == 'Password'
            ? InkWell(
                onTap: textObscureCallback,
                child: Icon(obscure ? Icons.visibility : Icons.visibility_off),
              )
            : suffixIconData != null
                ? Icon(suffixIconData)
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
