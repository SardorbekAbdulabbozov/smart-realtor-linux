import 'package:flutter/material.dart';

class SingleInfoItem extends StatelessWidget {
  const SingleInfoItem({
    Key? key,
    required this.icon,
    required this.content,
    required this.title,
    this.iconColor,
  }) : super(key: key);
  final IconData icon;
  final Color? iconColor;
  final String content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        horizontalTitleGap: -10,
        leading: Icon(icon, color: iconColor),
        title: Text(title),
        trailing: Text(
          content,
          textAlign: TextAlign.end,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        dense: true,
      ),
    );
  }
}
