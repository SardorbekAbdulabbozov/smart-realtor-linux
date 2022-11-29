import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);
  final String title;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/ic_$icon.svg'),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.red : Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
