import 'package:flutter/material.dart';

class CustomMouseRegion extends StatelessWidget {
  const CustomMouseRegion({
    Key? key,
    required this.mouseRegionListener,
    required this.child,
    required this.onTap,
  }) : super(key: key);
  final void Function(bool) mouseRegionListener;
  final void Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        mouseRegionListener(true);
      },
      onExit: (event) {
        mouseRegionListener(false);
      },
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
