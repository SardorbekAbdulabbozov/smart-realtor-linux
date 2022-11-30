import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_home/core/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color,
    this.textStyle,
    this.constraints,
    this.isLoading = false,
    this.isEnabled = true,
    this.iconColor,
    this.icon,
  }) : super(key: key);
  final void Function() onPressed;
  final bool isEnabled;
  final bool isLoading;
  final String title;
  final Color? color;
  final Color? iconColor;
  final TextStyle? textStyle;
  final Size? constraints;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.red,
        minimumSize: constraints ?? Size(Get.width, 60),
        shape: const RoundedRectangleBorder(
          borderRadius: AppConstants.borderRadius12,
        ),
        textStyle: textStyle,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: textStyle ??
                const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
          ),
          if (icon!=null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
          if (isLoading) const SizedBox(width: 16),
          if (isLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.5,
              ),
            ),
        ],
      ),
    );
  }
}
