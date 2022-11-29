import 'package:flutter/material.dart';
import 'package:my_home/core/constants/app_constants.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    this.isEmailField = false,
    required this.title,
    required this.content,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String content;
  final IconData icon;
  final bool isEmailField;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: isEmailField
            ? Row(
          mainAxisSize: MainAxisSize.min,
                children: [
                  Text(content),
                  AppConstants.boxWidth4,
                  const Text(
                    '*Verification required',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              )
            : Text(content),
      ),
    );
  }
}
