import 'package:flutter/material.dart';

class TableItem extends StatelessWidget {
  const TableItem({
    Key? key,
    this.title,
    this.child,
    required this.width,
  }) : super(key: key);
  final double width;
  final String? title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: child ?? Center(
        child: Text(
          title??'',
          style: const TextStyle(fontSize: 16),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
