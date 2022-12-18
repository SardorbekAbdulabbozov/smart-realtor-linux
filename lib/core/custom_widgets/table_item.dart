import 'package:flutter/material.dart';

class TableItem extends StatelessWidget {
  const TableItem({
    Key? key,
    this.title,
    this.child,
    required this.width,
    this.isHeader = false,
  }) : super(key: key);
  final bool isHeader;

  final double width;
  final String? title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: child ??
          Center(
            child: Text(
              title ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
    );
  }
}
